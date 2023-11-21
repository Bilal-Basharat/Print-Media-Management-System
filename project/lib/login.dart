// lib/login_page.dart
import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/mainmenu.dart';
import 'package:project/DesignerScreen.dart';
import 'package:project/PrinterScreen.dart';
import 'package:project/AdminScreen.dart';
import 'package:project/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart'; // Create a home page file as well

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // void loginUser() async {
  //   if (!_emailController.text.isEmpty || !_passwordController.text.isEmpty) {
  //     var regBody = {
  //       "email": _emailController.text,
  //       "password": _passwordController.text,
  //     };
  //
  //     var response = await http.post(
  //       Uri.parse('http://192.168.51.207:3000/api/users/login'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(regBody),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Successful login
  //       print('Login successful');
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => MainmenuActivity(),
  //         ),
  //       );
  //     } else {
  //       // Unsuccessful login
  //       print('Login failed');
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Error'),
  //           content: Text('Invalid credentials'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } else {
  //     // Handle empty fields
  //   }
  // }
  void loginUser() async {

        // Check the email and password to determine the role
        if (_emailController.text == 'admin@yahoo.com' &&
            _passwordController.text == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AdminScreen(),
            ),
          );
        } if (_emailController.text == 'designer@gmail.com' &&
            _passwordController.text == 'd123') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DesignerScreen(),
            ),
          );
        } if (_emailController.text == 'printer@example.com' &&
            _passwordController.text == 'p123') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PrinterScreen(),
            ),
          );
        }
        if (!_emailController.text.isEmpty || !_passwordController.text.isEmpty) {
          var regBody = {
            "email": _emailController.text,
            "password": _passwordController.text,
          };

          var response = await http.post(
            Uri.parse('http://192.168.0.103:3000/api/users/login'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(regBody),
          );

          if (response.statusCode == 200) {
            // Successful login
            print('Login successful');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainmenuActivity(),
              ),
            );}
        //   else {
        //   // Invalid credentials
        //   print('Invalid credentials');
        //   showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //       title: Text('Error'),
        //       content: Text('Invalid credentials'),
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           child: Text('OK'),
        //         ),
        //       ],
        //     ),
        //   );
        // }
      }
          else {
        // Unsuccessful login
        print('Login failed');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Invalid credentials'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
                loginUser();
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();

                // Check username and password (you may want to connect to a backend for validation)
                // if (email == 'example' && password == 'password') {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //        builder: (context) => MainmenuActivity(),
                //     ),
                //   );
                // }
                // else {
                //   // Show an error message or handle invalid credentials
                //   showDialog(
                //     context: context,
                //     builder: (context) => AlertDialog(
                //       title: Text('Error'),
                //       content: Text('Invalid credentials'),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: Text('OK'),
                //         ),
                //       ],
                //     ),
                //   );
                // }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {

                // Navigate to the login screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: Text(
                'Create an Account? Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
