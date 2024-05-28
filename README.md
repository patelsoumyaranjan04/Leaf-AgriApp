# Leaf-AgriApp
A mobile assistant for farmers that provides agriculture and market insights using AI conversations for recommendations, deep learning crop image diagnosis, realtime mandi commodity price to optimize sales, and location-specific guidance on crops, diseases, and pricing through an interface for conversation, image upload.


### Important Links

[Demo video link](https://youtu.be/2d825CIaHVQ)


[Kaggle Dataset Used for Plant disease detection](https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset)


### Overview

This mobile application provides customized expert assistance and market insights to farmers through AI and mandi integration.
 
## Key Features
 
- **Conversational AI** - Farmers can interact with a conversational agent powered by large language models like GPT-3 to get tailored agriculture recommendations.
 
- **Image Recognition** - Using deep learning, farmers can diagnose plant diseases by uploading images of affected crops.
 
- **Realtime Mandi Prices** - Farmers can check current commodity prices across mandis in India to optimize sales and get fair prices.
 
- **Personalized Insights** - Combining conversational AI, computer vision, and mandi data, the app provides location-specific guidance on crops, diseases, prices, and more.
 
- **Intuitive Interface** - A user-friendly interface makes it easy for farmers to get advice through conversation, image uploads, and interactive mandi price charts.


### Technologies used

* Flutter
* Flask
* PyTorch
* Open Government Data API
* Cloud Messaging
* Rest APIs
* Pandas
* Numpy
* Ngrok

### Screenshots

<img src="https://github.com/patelsoumyaranjan04/Leaf-AgriApp/blob/main/Snapshots/S1.jpeg" width="250" title="hover text">

<img src="https://github.com/patelsoumyaranjan04/Leaf-AgriApp/blob/main/Snapshots/S2.jpeg" width="250" title="hover text">

<img src="https://github.com/patelsoumyaranjan04/Leaf-AgriApp/blob/main/Snapshots/S3.jpeg" width="250" title="hover text">
<img src="https://github.com/patelsoumyaranjan04/Leaf-AgriApp/blob/main/Snapshots/S4.jpeg" width="250" title="hover text">
<img src="https://github.com/patelsoumyaranjan04/Leaf-AgriApp/blob/main/Snapshots/S5.jpeg" width="250" title="hover text">
<img src="https://github.com/patelsoumyaranjan04/Leaf-AgriApp/blob/main/Snapshots/S6.jpeg" width="250" title="hover text">


## Getting Started

Follow these instructions to set up and run the project locally.

### Prerequisites


_In order to run the application on your local device make sure to have flutter environment setup on your local device_

[Flutter setup video](https://www.youtube.com/watch?v=fDnqXmLSqtg "Video")


### Installation and SetUp

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/patelsoumyaranjan04/Leaf-AgriApp.git
   cd your-repo

2. Install the required Python packages.
   ```bash
   pip install -r requirements.txt

3. [Open Government Data](https://data.gov.in/resource/current-daily-price-various-commodities-various-markets-mandi) API set up.
   Go to the file path `Leaf-AgriApp/flask-server/app.py' and decalre your API key
   ```
   price_api_key="your api key"
4. OpenAI API set up.
   Go to the file path `Leaf-AgriApp/leaf-app/lib/secrets.dart' and decalre your API key
   ```
   const openAiApiKey = 'your OpenAI API key';
### Using Ngrok
For testing purposes, you can use Ngrok to expose your Flask server to the internet for real-time testing with your Flutter app. Follow the Ngrok [documentation](https://ngrok.com/docs/getting-started/) to set up and configure it for your Flask server.
### Usage

_Start the Flask server_
```
python app.py
```

_Connect your mobile in USB Debug mode_

_write in terminal "flutter run"_

## Authors
This project was a collaborative effort for Smart India Hackathon 2023.

- [@Aum Atman Behera](https://github.com/678aum)
- [@Bidhan Ranjan Bhoi](https://github.com/777BRB)
- [@Krushna S. Baral](https://github.com/krishnasbaral)
- [@Manas Ranjan Sethi](https://github.com/Manas2k3)
- [@Satyajeet Patra](https://github.com/SatyajeetPatra-11)
- [@Soumya Ranjan Patel](https://www.github.com/patelsoumyaranjan04)

