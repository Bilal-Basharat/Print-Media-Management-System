import 'package:flutter/material.dart';
import 'package:project/CartScreen.dart';
import 'package:project/UserInfoInputScreen.dart';
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OutdoorPosterPage(),
//     );
//   }
// }

class OutdoorPosterPage extends StatefulWidget {

  @override
  _OutdoorPosterPageState createState() => _OutdoorPosterPageState();
}

class _OutdoorPosterPageState extends State<OutdoorPosterPage> {
  String selectedSize = '';
  String selectedOrientation = '';
  String selectedPaper = '';
  int quantity = 0;
  int price = 0;
  String installationOption = '';
  String designDescription = ''; // Variable to store the design description
  String type = 'outdoorposter';

  // Variable to store the type
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outdoor Poster'),
        backgroundColor: Color(0xFF880A35),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Size',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PosterButton(
                    image: 'assets/images/size.png',
                    text: 'A4',
                    onTap: () {
                      setState(() {
                        selectedSize = 'A4';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/size.png',
                    text: 'A3',
                    onTap: () {
                      setState(() {
                        selectedSize = 'A3';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/size.png',
                    text: 'A2',
                    onTap: () {
                      setState(() {
                        selectedSize = 'A2';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/size.png',
                    text: 'B1',
                    onTap: () {
                      setState(() {
                        selectedSize = 'B1';
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
                    image: 'assets/images/port.png',
                    text: 'Portrait',
                    onTap: () {
                      setState(() {
                        selectedOrientation = 'Portrait';
                      });
                    },
                  ),
                  PosterButton(
                    image: 'assets/images/land.png',
                    text: 'Landscape',
                    onTap: () {
                      setState(() {
                        selectedOrientation = 'Landscape';
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
                    image: 'assets/images/page.png',
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
                    price = quantity * 300;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Price: ${price.toString()}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  UserInfo userInfo = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInfoInputScreen()),
                  );

                  if (userInfo != null) {
                    // User has provided information, navigate to CartScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          selectedSize: selectedSize,
                          selectedOrientation: selectedOrientation,
                          selectedPaper: selectedPaper,
                          quantity: quantity,
                          price: price,
                          installationOption: installationOption,
                          designDescription: designDescription,
                          type: type,
                          email: userInfo.email,
                          name: userInfo.name,
                          contact: userInfo.contact,
                          address: userInfo.address,
                          carddetails: userInfo.cardDetails,
                        ),
                      ),
                    );
                  }
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
