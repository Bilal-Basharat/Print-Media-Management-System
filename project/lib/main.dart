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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  // bool isnotvalid = false;
  void registerUser() async
  {
    if( !_emailController.text.isEmpty || !_passwordController.text.isEmpty ||
    !_firstNameController.text.isEmpty || !_lastNameController.text.isEmpty || !_addressController.text.isEmpty || !_contactController.text.isEmpty)
    {
      var regBody = {

        "email":_emailController.text,
        "password":_passwordController.text,
        "firstname":_firstNameController.text,
        "lastname":_lastNameController.text,
        "address":_addressController.text,
        "contact":_contactController.text
      };
      var response = await http.post(Uri.parse('http://192.168.0.103:3000/api/users/register'),
          headers: {"Content-Type":"application/json"},
          body: jsonEncode(regBody)

      );
      print(response);
    }else{


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                // obscureText: true,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(

                onPressed: () {
                  registerUser();
                  // Handle sign-up logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                  // String email = _emailController.text;
                  // String password = _passwordController.text;
                  // String firstname = _firstNameController.text;
                  // String lastname = _lastNameController.text;
                  // String address = _addressController.text;
                  // String contact = _contactController.text;


                  // Perform sign-up actions (e.g., API call, authentication)
                  // Add your implementation here

                  // For demonstration purposes, print the input values

                  // print('Email: $email');
                  // print('Password: $password');
                  // print('First Name: $firstName');
                  // print('Last Name: $lastName');
                  // print('Address: $address');
                  // print('Contact: $contact');
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {

                  // Navigate to the login screen
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
