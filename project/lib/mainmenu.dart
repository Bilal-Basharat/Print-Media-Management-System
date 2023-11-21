import 'package:flutter/material.dart';
import 'package:project/Outdoorposter.dart';
import 'package:project/Banner.dart';
import 'package:project/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainmenuActivity(),
    );
  }
}

class MainmenuActivity extends StatefulWidget {
  const MainmenuActivity({Key? key}) : super(key: key);

  @override
  _MainmenuActivityState createState() => _MainmenuActivityState();
}

class _MainmenuActivityState extends State<MainmenuActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Express'),
        backgroundColor: Color(0xFF880A35),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle the profile button press
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                // Handle the "About Us" button press
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact'),
              onTap: () {
                // Handle the "Contact" button press
              },
            ),
            Divider(), // Add a divider
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle the "Logout" button press
                // You can perform the logout logic here
                // For example, navigate to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(), // Replace with your login screen
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 196.0,
              margin: EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the login screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OutdoorPosterPage(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/img1.png', // Change the path accordingly
                        width: 140.0,
                        height: 143.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Outdoor Poster',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 196.0,
              margin: EdgeInsets.only(top: 40.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the login screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BannerPosterPage(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/img2.png', // Change the path accordingly
                        width: 140.0,
                        height: 143.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Banner',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ... Add similar code for other UI elements
          ],
        ),
      ),
    );
  }
}





// Add similar methods for other onTap actions

