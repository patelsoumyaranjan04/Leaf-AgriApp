# Leaf-AgriApp
A mobile assistant for farmers that provides agriculture and market insights using AI conversations for recommendations, deep learning crop image diagnosis, realtime mandi commodity price to optimize sales, and location-specific guidance on crops, diseases, and pricing through an interface for conversation, image upload, and interactive charts.


### _Code Monks_

* _Soumya Ranjan Patel_

### Important Links

[Demo video link](https://drive.google.com/drive/folders/1_QH_19TQNeMMl10CCHcl1uMIb5t8LOny)

[Presentation of our idea](https://www.canva.com/design/DAEODJfeMvQ/qXX7OivLJ0kkQ7KPmvaJ-w/edit)

[Kaggle Dataset Used for Plant disease detection](https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset)

[ML model for crop prediction written on Colab ](https://colab.research.google.com/drive/17jMLUXK8p6B48CAPW_8DZANxF_CB3jDY?authuser=1)

[APK (Just in case application doesn't run locally)](https://drive.google.com/file/d/1vAfO7OQnAB9hZbjp01v64lLL70S90_34/view?usp=sharing)

### Overview

This mobile application provides customized expert assistance and market insights to farmers through AI and mandi integration.
 
## Key Features
 
- **Conversational AI** - Farmers can interact with a conversational agent powered by large language models like GPT-3 to get tailored agriculture recommendations.
 
- **Image Recognition** - Using deep learning, farmers can diagnose plant diseases by uploading images of affected crops.
 
- **Realtime Mandi Prices** - Farmers can check current commodity prices across mandis in India to optimize sales and get fair prices.
 
- **Personalized Insights** - Combining conversational AI, computer vision, and mandi data, the app provides location-specific guidance on crops, diseases, prices, and more.
 
- **Intuitive Interface** - A user-friendly interface makes it easy for farmers to get advice through conversation, image uploads, and interactive mandi price charts.


### Technology used

* Flutter
* Flask
* PyTorch
* Open Government Data API
* Cloud Messaging
* Rest APIs
* Pandas
* Numpy
* Ngrok

### Screenshots/Demo Video

<img src="https://github.com/UtkarshA135/KisanSeva/blob/master/IMG-20201130-WA0055.jpg" width="250" title="hover text">

<img src="https://github.com/UtkarshA135/KisanSeva/blob/master/s.jpg" width="250" title="hover text">

<img src="https://github.com/UtkarshA135/KisanSeva/blob/master/IMG_20210421_083435.jpg" width="250" title="hover text">
<img src="https://github.com/UtkarshA135/KisanSeva/blob/master/s.png" width="250" title="hover text">
<img src="https://github.com/UtkarshA135/KisanSeva/blob/master/s%20(1).jpg" width="250" title="hover text">
<img src="https://github.com/UtkarshA135/KisanSeva/blob/master/IMG_20210421_084044.jpg" width="250" title="hover text">


## Getting Started

Follow these instructions to set up and run the project locally.

### Prerequisites


_In order to run the application on your local device make sure to have flutter environment setup on your local device_

[Flutter setup video](https://www.youtube.com/watch?v=fDnqXmLSqtg "Video")


### Installation

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
### Usage

_In order to run the application on your local device make sure to have flutter environment setup on your local device_

[Flutter setup video](https://www.youtube.com/watch?v=fDnqXmLSqtg "Video")

_Clone the repo and open it in any text editor - VS Code for example_

_Connect your mobile in USB Debug mode_

_write in terminal "flutter run"_

### Tracks used
_Agriculture :-  Since farmers are facing a lot of issues and there is protest going on which has worsened the situation so we decided to come up with a smart solution to the problem by including features like Rent tools and Smart connect to the Mandi which will surely propel the growth of farmers._

### Proposed add on features
 
To remove the issue of providing statical data in crop prediction feature we are thinking of integrating the app with an IOT model where perhaps a Node MCU model will collect all data like soil pH , Rainfall etc and send it to the real-time database and using the ML model built in the Goggle Collab we can predict the crop.
Also in Feed feature we didn't get any API which would provide news solely related to Agro industry so we are working on that.
