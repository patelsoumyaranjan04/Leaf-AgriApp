from flask import Flask, request, jsonify
import requests
from ml_module import ResNet9, Prediction_Model
from PIL import Image
import torch

# Create an instance of the Prediction_Model
buffer_model = Prediction_Model()

# Path to the model file
Model_Path = '../ML_Model/plant_disease_model.pth'

# Load the model
model = ResNet9()
model=torch.load(Model_Path, map_location=torch.device('cpu'))
model.eval()

price_api_key = "Replace with your API key"  

app = Flask(__name__)

@app.route('/predict', methods=['POST'])  
def predict():
    try:
        # Get the image file from the request
        image = request.files['image']
        plant_name = request.form['plant_name']

     

        image = Image.open(image)

        # Perform inference using the model
        prediction=buffer_model.predict_image(image,model)
       


        flag =False

        for op in prediction:
          
            predicted_disease = op.split('___')[1].replace('(', '').replace(')', '').replace('_', ' ')
          
            if (plant_name == op.split('(')[0].split('_')[0]):
                    flag=True
                   
                    return jsonify({"plant_name": plant_name, "disease": predicted_disease})
        if(not flag):
            
            return jsonify({'error':"Try Again"})

    except Exception as e:
        
        return jsonify({'error': str(e)})
    
@app.route('/price', methods=['POST'])
def GetPrice():
 
    api_url = "https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070"
    
    # Define the parameters for the API request
    params = {
		'api-key': price_api_key,
        'format': 'json',
        'limit': 1,
        'filters[state]': request.form['state'],
        'filters[district]': request.form['district'],
        'filters[market]': request.form['market'],
        'filters[commodity]': request.form['commodity']
    }

    try:
        response = requests.get(api_url,params=params)
        response_data = response.json()

        # Process the response data
       
        max_price = int(response_data["records"][0]["max_price"])
        max_price=max_price/100
        min_price = int(response_data["records"][0]["min_price"])
        min_price=min_price/100

        
        return jsonify({"max_price": max_price, "min_price": min_price}), 200
    except Exception as e:
        return str(e), 500  


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80,debug=True)









