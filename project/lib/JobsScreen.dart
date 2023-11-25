import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';


class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  String _selectedRole='';
  // bool isnotvalid = false;
  void registerUser() async
  {
    if( !_emailController.text.isEmpty || !_passwordController.text.isEmpty ||
        !_firstNameController.text.isEmpty || !_lastNameController.text.isEmpty || !_addressController.text.isEmpty || !_contactController.text.isEmpty || !_selectedRole.isEmpty)
    {
      var regBody = {

        "email":_emailController.text,
        "password":_passwordController.text,
        "firstname":_firstNameController.text,
        "lastname":_lastNameController.text,
        "address":_addressController.text,
        "contact":_contactController.text,
        "role":_selectedRole
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
        automaticallyImplyLeading: false, // Disable the default back button
        title: Text('Careers'),
        backgroundColor: Color(0xFF880A35),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
              DropdownButton<String>(
                value: _selectedRole,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRole = newValue!;
                  });
                },
                items: <String>['printer', 'designer','user',''] // Add 'user' or remove it if not needed
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                    .toList(),
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
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100.0), // Adjust the width
                  primary: Color(0xFF880A35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Adjust the radius
                  ),// Set the background color
                ),
                child: Text('Apply'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
