import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Results.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  late CameraController _cameraController;
  final TextEditingController _plantNameController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isSendingData = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();

    if (cameras.isNotEmpty) {
      final firstCamera = cameras.first;
      _cameraController = CameraController(firstCamera, ResolutionPreset.medium);
      await _cameraController.initialize();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _checkButtonEnabled();
    }
  }

  void _checkButtonEnabled() {
    if (_imageFile != null && _plantNameController.text.isNotEmpty) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  _sendDataToServer() async {
    final BuildContext currentContext = context;

    if (_isButtonEnabled) {
      setState(() {
        _isSendingData = true;
      });

      final imageFile = _imageFile;
      final plantName = _plantNameController.text;

      try {
        final url = Uri.parse('https://cunning-chicken-multiply.ngrok-free.app/predict');
        final request = http.MultipartRequest('POST', url);
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            imageFile!.path,
          ),
        );
        request.fields['plant_name'] = plantName;

        final response = await request.send();
        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          final responseData = json.decode(responseBody);

          final plantName = responseData['plant_name'];
          final predictedDisease = responseData['disease'];
          final errorMsg = responseData['errorMsg'];

          Navigator.push(
            currentContext,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                plantName: plantName,
                disease: predictedDisease,
              ),
            ),
          );

          setState(() {
            _isSendingData = false;
          });
        } else {
          print('Failed to send image. Status code: ${response.statusCode}');
          setState(() {
            _isSendingData = false;
          });
        }
      } catch (e) {
        print('Error sending image: $e');
        setState(() {
          _isSendingData = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _plantNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera and Gallery'),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: Center(
                  child: _imageFile == null
                      ? const Text('No image selected')
                      : Image.file(_imageFile!),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                'Capture from Camera',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                'Pick from Gallery',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _plantNameController,
                decoration: const InputDecoration(
                  hintText: 'Name of the Plant',
                ),
                onChanged: (value) {
                  _checkButtonEnabled();
                },
              ),
            ),
            ElevatedButton(
              onPressed: _isButtonEnabled ? _sendDataToServer : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
            if (_isSendingData)
              const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
