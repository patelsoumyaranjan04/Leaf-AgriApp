import 'package:flutter/material.dart';
import 'package:leaf_check/chat_api.dart';
import 'Camera.dart';
import 'PriceChecker.dart';
import 'ChatApp.dart'; // Import ChatApp.dart

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_currentIndex), // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Capture/Add Image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            label: 'Price Checker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat Bot',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          // Handle button taps here
          setState(() {
            _currentIndex = index;
          });

          if (index == 2) {
            // Navigate to ChatApp.dart and pass the chatApi instance
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatApp(chatApi: ChatApi(),)), // Pass the chatApi instance here
            );
          }
        },
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return CameraPage(); // Show CameraPage content
      case 1:
        return PriceCheckerPage(); // Show PriceCheckerPage content
      case 2:
        return ChatApp(chatApi: ChatApi(),); // Placeholder for Chat Bot, you can customize this
      default:
        return SizedBox.shrink();
    }
  }
}
