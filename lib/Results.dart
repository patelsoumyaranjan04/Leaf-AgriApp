import 'package:flutter/material.dart';
import 'package:leaf_check/ChatApp.dart';
import 'chat_api.dart';


class ResultPage extends StatelessWidget {
  final String plantName;
  final String disease; // You will receive this data from the Flask server

  ResultPage({
    required this.plantName,
    required this.disease,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name of the Plant:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: plantName, // Set the initial value from the CameraPage
              readOnly: true, // Make it non-editable
              decoration: const InputDecoration(
                hintText: 'Name of the Plant',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Disease:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: disease, // Set the initial value received from the server
              readOnly: true, // Make it non-editable
              decoration: const InputDecoration(
                hintText: 'Disease',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatApp(chatApi: ChatApi(),)),
                );
              },
              child: const Text('Need Assistance/Help'),
            ),
          ],
        ),
      ),
    );
  }
}
