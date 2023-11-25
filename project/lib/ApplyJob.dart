import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApplyScreen extends StatefulWidget {




  @override
  _ApplyScreenState createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  TextEditingController _reviewController = TextEditingController();

  void Send_mail(){
    var
    Service_id='service_fpdbuyt',
        Template_id='template_ll7mt6h',
        User_id='s8BPFicQhyWq8BeHp';
    var s=http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'origin':'http:localhost',
          'Content-Type':'application/json'
        },
        body: jsonEncode({
          'service_id':Service_id,
          'user_id':User_id,
          'template_id':Template_id,
          'template_params':{
            'name':'admin',
            'message':_reviewController.text,
            'sender':'emahnoor@yahoo.com'

          }
        })
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for job'),
        backgroundColor: Color(0xFF880A35),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send in a proper format',

              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ), Text(
              'first name:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),Text(
              'last name:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),Text(
              'email:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),Text(
              'contact:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),Text(
              'address:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),Text(
              'role you are applying for:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'give info here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child:ElevatedButton(
                onPressed: () {
                  Send_mail();

                },
                style: ElevatedButton.styleFrom(

                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  // Adjust the width
                  primary: Color(0xFF880A35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius
                  ),
                ),
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
