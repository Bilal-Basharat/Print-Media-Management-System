// designer_screen.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/DesignerStatus.dart';
import 'dart:convert';
import 'task.dart';

class DesignerScreen extends StatefulWidget {
  final String userEmail;
  final String userPassword;

  DesignerScreen({required this.userEmail, required this.userPassword});

  @override
  _DesignerScreenState createState() => _DesignerScreenState();
}

class _DesignerScreenState extends State<DesignerScreen> {
  List<Task> _task = [];

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.0.103:3000/api/items/unassigned'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> orderData = json.decode(response.body);
        print('Order Data: $orderData'); // Add this line to print order data
        setState(() {
          _task.clear();
          _task = orderData.map((data) => Task.fromJson(data)).toList();
        });
      } else {
        print('Failed to load orders. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error fetching orders: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF880A35),
        title: Text('Designer Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tasks',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _task.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    title: Text('Type: ${_task[index].type}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Size: ${_task[index].size}'),
                        Text('Paper Orientation: ${_task[index].paperorient}'),
                        Text('Paper: ${_task[index].paper}'),
                        Text('Description: ${_task[index].des}'),
                        Text('Quantity: ${_task[index].quantity}'),
                        Text('Email: ${_task[index].email}'),
                        Text('Name: ${_task[index].name}'),
                        Text('Contact: ${_task[index].contact}'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DesignerStatus(
                              task: _task[index],
                              userEmail: widget.userEmail,
                              userPassword: widget.userPassword,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(

                        // Adjust the width
                        primary: Color(0xFF880A35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius
                        ),
                      ),
                      child: Text('View Order'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
