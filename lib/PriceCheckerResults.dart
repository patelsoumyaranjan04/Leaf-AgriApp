import 'package:flutter/material.dart';

class PriceCheckerResultsPage extends StatelessWidget {
  final String state;
  final String district;
  final String market;
  final String commodity;
  final double minPrice;
  final double maxPrice;

  const PriceCheckerResultsPage({
    Key? key,
    required this.state,
    required this.district,
    required this.market,
    required this.commodity,
    required this.minPrice,
    required this.maxPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Price Checker Results',
          style: TextStyle(
            fontFamily: 'Roboto', // Use a custom font if desired
            fontSize: 20.0, // Increase the font size
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'State:',
              style: TextStyle(
                fontSize: 18.0, // Increase the font size
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.blue, // Change the text color
              ),
            ),
            Text(
              state,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0), // Add spacing
            Text(
              'District:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              district,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Market:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              market,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Commodity:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              commodity,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Minimum Price:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              '${minPrice.toStringAsFixed(2)} /Kg',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Maximum Price:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              '${maxPrice.toStringAsFixed(2)} /Kg',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
