import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final String selectedSize;
  final String selectedOrientation;
  final String selectedPaper;
  final int quantity;
  final int price;
  final String installationOption;
  final String designDescription;
  final String type; // Add type parameter

  CartScreen({
    required this.selectedSize,
    required this.selectedOrientation,
    required this.selectedPaper,
    required this.quantity,
    required this.price,
    required this.installationOption,
    required this.designDescription,
    required this.type, // Initialize type
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF880A35),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Selected Type: $type'), // Display the selected type
            Text('Selected Size: $selectedSize'),
            Text('Selected Orientation: $selectedOrientation'),
            Text('Selected Paper: $selectedPaper'),
            Text('Quantity: $quantity'),
            Text('Price: \$${price.toString()}'),
            Text('Installation Option: $installationOption'),
            Text('Design Description: $designDescription'),
          ],
        ),
      ),
    );
  }
}
