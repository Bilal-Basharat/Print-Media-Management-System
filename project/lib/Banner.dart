import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BannerPosterPage(),
    );
  }
}

class BannerPosterPage extends StatefulWidget {
  @override
  _BannerPosterPageState createState() => _BannerPosterPageState();
}

class _BannerPosterPageState extends State<BannerPosterPage> {
  String selectedSize = '';
  String selectedOrientation = '';
  String selectedPaper = '';
  int quantity = 0;
  int price = 0;
  String installationOption = '';
  String designDescription = ''; // Variable to store the design description

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banner'),
        backgroundColor: Color(0xFF880A35),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Size (cm)',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PosterButton(
                    image: 'assets/images/img1.png',
                    text: '380x280',
                    onTap: () {
                      setState(() {
                        selectedSize = '380 x 280 cm';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/img1.png',
                    text: '400x300',
                    onTap: () {
                      setState(() {
                        selectedSize = '400x300cm';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/img1.png',
                    text: '580x280',
                    onTap: () {
                      setState(() {
                        selectedSize = '580x280cm';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/img1.png',
                    text: '600x300',
                    onTap: () {
                      setState(() {
                        selectedSize = '600 x 300 cm';
                      });
                    },
                  ),
                ],
              ),
              Text(
                'Paper Orientation',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PosterButton(
                    image: 'assets/images/img1.png',
                    text: '4 pieces',
                    onTap: () {
                      setState(() {
                        selectedOrientation = '4 pieces';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/img1.png',
                    text: '8 pieces',
                    onTap: () {
                      setState(() {
                        selectedOrientation = '8 pieces';
                      });
                    },
                  ),
                ],
              ),
              Text(
                'Paper',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PosterButton(
                    image: 'assets/images/img1.png',
                    text: 'Magistra Deluxe Blueback',
                    onTap: () {
                      setState(() {
                        selectedPaper = 'Magistra Deluxe Blueback';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Design Description',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter design description...',
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // Allows multiline input
                onChanged: (value) {
                  setState(() {
                    designDescription = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Installation',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(
                    value: 'Yes',
                    groupValue: installationOption,
                    onChanged: (value) {
                      setState(() {
                        installationOption = value as String;
                      });
                    },
                  ),
                  Text('Yes'),
                  Radio(
                    value: 'No',
                    groupValue: installationOption,
                    onChanged: (value) {
                      setState(() {
                        installationOption = value as String;
                      });
                    },
                  ),
                  Text('No'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Quantity',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter quantity...',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    quantity = int.tryParse(value) ?? 0;
                    price = quantity * 2000;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Price: \$${price.toString()}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Add to cart logic
                  // You can use the selectedSize, selectedOrientation, selectedPaper,
                  // installationOption, quantity, price, and designDescription variables
                  // to perform further actions.
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PosterButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? onTap;

  PosterButton({required this.image, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 82.0,
                  height: 89.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  text,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
