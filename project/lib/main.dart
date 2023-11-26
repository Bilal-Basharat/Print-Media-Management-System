import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  // Role for the user
  final role = 'user';

  // Function to handle user registration
  void registerUser() async {
    // Check if all required fields are filled
    if (!_emailController.text.isEmpty &&
        _emailController.text.contains('@') &&
        !_passwordController.text.isEmpty &&
        _passwordController.text.length >= 8 &&
        !_firstNameController.text.isEmpty &&
        !_lastNameController.text.isEmpty &&
        !_addressController.text.isEmpty &&
        !_contactController.text.isEmpty) {

      // Create the request body
      var regBody = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "firstname": _firstNameController.text,
        "lastname": _lastNameController.text,
        "address": _addressController.text,
        "contact": _contactController.text,
        "role": role
      };

      // Send a POST request to register the user
      var response = await http.post(
        Uri.parse('http://192.168.0.103:3000/api/users/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      // Check the response status
      if (response.statusCode == 201) {
        // Display a success message and navigate to the login page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Successfully'),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else if (response.statusCode == 400) {
        // Email is already registered, display a message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email is already in use.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Handle other error cases if needed
        print(response.body);
      }
    } else {
      // Display a message to fill all fields or correct the email/password format
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields or enter a valid email and a password of at least 8 characters.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Print Express'),
        backgroundColor: Color(0xFF880A35),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or image
              Image.asset(
                'assets/images/icon.png', // Replace with your image path
                height: 100.0, // Adjust the height as needed
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Email text field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              // Password text field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                // obscureText: true,
              ),
              SizedBox(height: 16.0),
              // First Name text field
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16.0),
              // Last Name text field
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 16.0),
              // Address text field
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16.0),
              // Contact text field
              TextField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 32.0),
              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  primary: Color(0xFF880A35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text('Sign Up'),
              ),
              SizedBox(height: 16.0),
              // Link to login page
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'Already have an account? Sign In',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
