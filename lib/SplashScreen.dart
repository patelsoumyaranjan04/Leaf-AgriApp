import 'package:flutter/material.dart';
import 'package:leaf_check/Home Page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(), // Show the splash screen initially
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate the splash screen duration
    Future.delayed(const Duration(seconds: 3), () {

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const  HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.jpg', // Path to your splash image
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            const SizedBox(height: 20), // Adjust the height as needed
            const Text(
              'Kishan Mitra',
              style: TextStyle(
                fontSize: 32, // Adjust the font size as needed
                color: Colors.green, // Text color
                fontWeight: FontWeight.bold, // Text weight
                fontStyle: FontStyle.italic, // Text style
              ),
            ),
          ],
        ),
      ),
    );
  }
}



