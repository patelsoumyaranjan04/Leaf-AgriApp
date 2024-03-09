import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'PriceCheckerResults.dart';

class PriceCheckerPage extends StatefulWidget {
  const PriceCheckerPage({Key? key}) : super(key: key);

  @override
  _PriceCheckerPageState createState() => _PriceCheckerPageState();
}

class _PriceCheckerPageState extends State<PriceCheckerPage> {
  String? selectedState;
  String? selectedDistrict;
  String? selectedMarket;
  String? selectedCommodity;

  bool isButtonEnabled = false; // Initialize the button as disabled
  bool isLoading = false; // Initialize the loading state as false
  late double minPrice; // Placeholder values
  late double maxPrice;

  // Function to check if all fields are filled and enable the button
  void checkFields() {
    setState(() {
      isButtonEnabled = selectedState != null &&
          selectedDistrict != null &&
          selectedMarket != null &&
          selectedCommodity != null;
    });
  }

  Future<void> fetchDataFromServer() async {
    if (isButtonEnabled) {
      // Show loading indicator when fetching data
      setState(() {
        isLoading = true;
      });

      final url = Uri.parse('https://cunning-chicken-multiply.ngrok-free.app/price'); // Replace with your Flask server API URL
      final request = http.MultipartRequest('POST', url);

      request.fields['state'] = selectedState!;
      request.fields['district'] = selectedDistrict!;
      request.fields['market'] = selectedMarket!;
      request.fields['commodity'] = selectedCommodity!;

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseData = json.decode(responseBody);

        setState(() {
          minPrice = responseData['min_price']; // Retrieve the minimum price from the response
          maxPrice = responseData['max_price']; // Retrieve the maximum price from the response
          isLoading = false; // Hide loading indicator when data is fetched
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PriceCheckerResultsPage(
              state: selectedState!,
              district: selectedDistrict!,
              market: selectedMarket!,
              commodity: selectedCommodity!,
              minPrice: minPrice,
              maxPrice: maxPrice,
            ),
          ),
        );
      } else {
        // Handle errors
        print('Failed to fetch data from the server. Status code: ${response.statusCode}');
        // Hide loading indicator when there is an error
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Checker'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: selectedState,
                onChanged: (newValue) {
                  setState(() {
                    selectedState = newValue;
                  });
                  checkFields(); // Call the checkFields method when state is changed
                },
                items: <String>[
                  'Meghalaya',
                  'Odisha',
                  'Tamil Nadu'
                  // Add more states as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedDistrict,
                onChanged: (newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                  });
                  checkFields(); // Call the checkFields method when district is changed
                },
                items: <String>[
                  'West Khasi Hills',
                  'Kendrapara',
                  'Coimbature'

                  // Add more districts as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedMarket,
                onChanged: (newValue) {
                  setState(() {
                    selectedMarket = newValue;
                  });
                  checkFields(); // Call the checkFields method when market is changed
                },
                items: <String>[
                  'Nongstoin',
                  'Gopa',
                  'Madathukulam'
                  // Add more markets as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Market',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedCommodity,
                onChanged: (newValue) {
                  setState(() {
                    selectedCommodity = newValue;
                  });
                  checkFields(); // Call the checkFields method when commodity is changed
                },
                items: <String>[
                  'French Beans(Frasbean)',
                  'Potato',
                  'Coconut'

                  // Add more commodities as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Commodity',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isButtonEnabled ? fetchDataFromServer : null,
                child: Text('Check Price'),
              ),
              Visibility(
                visible: isLoading, // Show the progress indicator only when isLoading is true
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
