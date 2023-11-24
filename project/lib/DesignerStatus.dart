// designer_status.dart

import 'package:flutter/material.dart';
import 'package:project/task.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_model.dart';

class DesignerStatus extends StatefulWidget {
  final Task task;
  final String userEmail;
  final String userPassword;


  DesignerStatus({
    required this.task,
    required this.userEmail,
    required this.userPassword,

  });

  @override
  _DesignerStatusState createState() => _DesignerStatusState();
}

class _DesignerStatusState extends State<DesignerStatus> {
  late String _selectedStatus;
  User? _user;
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();

    _selectedStatus = '';
    // Initialize the dropdown with the initial status
    _selectedStatus = widget.task.designerStatus;
    fetchUserData();

  }
  Future<void> fetchUserData() async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.103:3000/api/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': widget.userEmail, 'password': widget.userPassword}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        if (userData.containsKey('user')) {
          setState(() {
            _user = User.fromJson(userData['user']);
          });
        }
      } else {
        print('Failed to load user data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }
  Future<void> saveStatus() async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.103:3000/api/tasks/tasksadd'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'type': widget.task.type,
          'size': widget.task.size,
          'paperorient': widget.task.paperorient,
          'des': widget.task.des,
          'email': widget.task.email,
          'name': widget.task.name,
          'contact': widget.task.contact,
          'designeremail': widget.userEmail,
          'designerName':_user?.firstname ?? 'N/A',
          'designercontact': _user?.contact ?? 'N/A',
          'designerStatus': _selectedStatus,
        }),
      );

      if (response.statusCode == 201) {
        // Status saved successfully
        print('Status saved successfully');
      } else {
        // Failed to save status
        print('Failed to save status. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error saving status: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Designer Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Type: ${widget.task.type}'),
            Text('Size: ${widget.task.size}'),
            Text('Paper Orientation: ${widget.task.paperorient}'),
            Text('Paper: ${widget.task.paper}'),
            Text('Description: ${widget.task.des}'),
            Text('Quantity: ${widget.task.quantity}'),
            Text('Email: ${widget.task.email}'),
            Text('Name: ${widget.task.name}'),
            Text('Contact: ${widget.task.contact}'),
            Text('Designer email: ${_user?.email ?? 'N/A'}'),
            Text('Designer Name: ${_user?.firstname ?? 'N/A'}'),


            Text('Designer Contact: ${_user?.contact ?? 'N/A'}'),

            SizedBox(height: 20),

            // Dropdown button for status
            DropdownButton<String>(
              value: _selectedStatus,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedStatus = newValue;
                  });
                }
              },
              items: <String>['', 'Pending', 'Completed'] // Add an empty string as a default value
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            ElevatedButton(
              onPressed: () async {
                await saveStatus(); // Wait for saveStatus to complete
                Navigator.pop(context, _selectedStatus); // Return the selectedStatus to DesignerScreen
              },
              child: Text('Save Status'),
            ),
          ],
        ),
      ),
    );
  }
}
