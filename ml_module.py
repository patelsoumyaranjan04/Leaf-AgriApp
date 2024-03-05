

import torch

import torchvision.transforms as transforms

class ResNet9(torch.nn.Module):
        def _init_(self, in_channels, num_diseases):
            super().__init__()
            
            self.conv1 = ConvBlock(in_channels, 64)
            self.conv2 = ConvBlock(64, 128, pool=True) 
            self.res1 = nn.Sequential(ConvBlock(128, 128), ConvBlock(128, 128))
            
            self.conv3 = ConvBlock(128, 256, pool=True) 
            self.conv4 = ConvBlock(256, 512, pool=True) 
            self.res2 = nn.Sequential(ConvBlock(512, 512), ConvBlock(512, 512))
            
            self.classifier = nn.Sequential(nn.MaxPool2d(4),
                                        nn.Flatten(),
                                        nn.Linear(512, num_diseases))
            
        def forward(self, xb): 
            out = self.conv1(xb)
            out = self.conv2(out)
            out = self.res1(out) + out
            out = self.conv3(out)
            out = self.conv4(out)
            out = self.res2(out) + out
            out = self.classifier(out)
            return out
        


class Prediction_Model():


    def predict_image(self,img, model):
        class_labels=['Apple___Apple_scab',
 'Apple___Black_rot',
 'Apple___Cedar_apple_rust',
 'Apple___healthy',
 'Blueberry___healthy',
 'Cherry_(including_sour)___Powdery_mildew',
 'Cherry_(including_sour)___healthy',
 'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot',
 'Corn_(maize)___Common_rust_',
 'Corn_(maize)___Northern_Leaf_Blight',
 'Corn_(maize)___healthy',
 'Grape___Black_rot',
 'Grape___Esca_(Black_Measles)',
 'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)',
 'Grape___healthy',
 'Orange___Haunglongbing_(Citrus_greening)',
 'Peach___Bacterial_spot',
 'Peach___healthy',
 'Pepper,_bell___Bacterial_spot',
 'Pepper,_bell___healthy',
 'Potato___Early_blight',
 'Potato___Late_blight',
 'Potato___healthy',
 'Raspberry___healthy',
 'Soybean___healthy',
 'Squash___Powdery_mildew',
 'Strawberry___Leaf_scorch',
 'Strawberry___healthy',
 'Tomato___Bacterial_spot',
 'Tomato___Early_blight',
 'Tomato___Late_blight',
 'Tomato___Leaf_Mold',
 'Tomato___Septoria_leaf_spot',
 'Tomato___Spider_mites Two-spotted_spider_mite',
 'Tomato___Target_Spot',
 'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
 'Tomato___Tomato_mosaic_virus',
 'Tomato___healthy']
        transform = transforms.Compose([
            transforms.Resize((256, 256)),
            transforms.ToTensor(),
        ])
        input_tensor = transform(img).unsqueeze(0)
        
        output = model(input_tensor)
        
        k = 5
        top_classes = torch.topk(output, k, dim=1)

        results = [class_labels[class_label.item()] for class_label in top_classes[0]]
        
        return results

