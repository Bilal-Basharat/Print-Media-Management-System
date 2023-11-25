// // designer_status.dart
//
// import 'package:flutter/material.dart';
// import 'package:project/task.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'user_model.dart';
//
// class PrinterStatus extends StatefulWidget {
//   final Task task;
//   final String userEmail;
//   final String userPassword;
//
//   PrinterStatus({
//     required this.task,
//     required this.userEmail,
//     required this.userPassword,
//   });
//
//   @override
//   _PrinterStatusState createState() => _PrinterStatusState();
// }
//
// class _PrinterStatusState extends State<PrinterStatus> {
//   late String _selectedStatus;
//   User? _user;
//   late List<Task> _tasks;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _selectedStatus = '';
//     // Initialize the dropdown with the initial status
//     _selectedStatus = widget.task.designerStatus;
//     fetchUserData();
//
//   }
//   Future<void> updatePrinterStatus() async {
//     try {
//       final response = await http.put(
//         Uri.parse('http://192.168.0.103:3000/api/tasks/update-printer-status/${widget.task.id}'),
//         headers: {'Content-Type': 'application/json'},
//
//         body: jsonEncode({
//           'printeremail': widget.userEmail, // Replace with the actual printer email
//           'printerName': _user?.firstname ?? 'N/A', // Replace with the actual printer name
//           'printStatus': _selectedStatus,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         // Printer status updated successfully
//         print('Printer status updated successfully');
//       } else {
//         // Failed to update printer status
//         print('Failed to update printer status. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (error) {
//       print('Error updating printer status: $error');
//     }
//   }
//
//   Future<void> fetchUserData() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.0.103:3000/api/users/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': widget.userEmail, 'password': widget.userPassword}),
//       );
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> userData = json.decode(response.body);
//         if (userData.containsKey('user')) {
//           setState(() {
//             _user = User.fromJson(userData['user']);
//           });
//         }
//       } else {
//         print('Failed to load user data. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (error) {
//       print('Error fetching user data: $error');
//     }
//   }
//   Future<void> saveStatus() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.0.103:3000/api/tasks/tasksadd'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'type': widget.task.type,
//           'size': widget.task.size,
//           'paperorient': widget.task.paperorient,
//           'des': widget.task.des,
//           'email': widget.task.email,
//           'name': widget.task.name,
//           'contact': widget.task.contact,
//           'designeremail': widget.task.designeremail,
//           'designerName': widget.task.designerName,
//
//           'printeremail': widget.userEmail,
//           'printerName':_user?.firstname ?? 'N/A',
//           'printStatus': _selectedStatus,
//         }),
//       );
//
//       if (response.statusCode == 201) {
//         // Status saved successfully
//         print('Status saved successfully');
//       } else {
//         // Failed to save status
//         print('Failed to save status. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (error) {
//       print('Error saving status: $error');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Designer Status'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Type: ${widget.task.type}'),
//             Text('Size: ${widget.task.size}'),
//             Text('Paper Orientation: ${widget.task.paperorient}'),
//             Text('Paper: ${widget.task.paper}'),
//             Text('Description: ${widget.task.des}'),
//             Text('Quantity: ${widget.task.quantity}'),
//             Text('Email: ${widget.task.email}'),
//             Text('Name: ${widget.task.name}'),
//             Text('Contact: ${widget.task.contact}'),
//             Text('printer Name: ${widget.userEmail}'),
//             Text('Designer Contact: ${_user?.contact ?? 'N/A'}'),
//
//             SizedBox(height: 20),
//
//             // Dropdown button for status
//             DropdownButton<String>(
//               value: _selectedStatus,
//               onChanged: (String? newValue) {
//                 if (newValue != null) {
//                   setState(() {
//                     _selectedStatus = newValue;
//                   });
//                 }
//               },
//               items: <String>['', 'Pending', 'Completed'] // Add an empty string as a default value
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//
//             ElevatedButton(
//               onPressed: () async {
//                 await updatePrinterStatus(); // Wait for saveStatus to complete
//                 Navigator.pop(context, _selectedStatus); // Return the selectedStatus to DesignerScreen
//               },
//               child: Text('Save Status'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// printer_status.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_model.dart';
import 'task.dart';

class PrinterStatus extends StatefulWidget {
  final Task task;
  final String userEmail;
  final String userPassword;

  PrinterStatus({
    required this.task,
    required this.userEmail,
    required this.userPassword,
  });

  @override
  _PrinterStatusState createState() => _PrinterStatusState();
}

class _PrinterStatusState extends State<PrinterStatus> {
  late String _selectedStatus;
  User? _user;

  @override
  void initState() {
    super.initState();
    print('Task ID in PrinterStatus: ${widget.task.id}');
    _selectedStatus = widget.task.designerStatus;
    fetchUserData();
  }


  Future<void> updatePrinterStatus() async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.0.103:3000/api/tasks/update-task/${widget.task.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'printeremail': widget.userEmail,
          'printerName': _user?.firstname ?? 'N/A',
          'printStatus': _selectedStatus,
        }),
      );
      print('Task ID: ${widget.task.id}');
      if (response.statusCode == 200) {
        print('Printer status updated successfully');
      } else {
        print('Failed to update printer status. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error updating printer status: $error');
    }
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
  void Send_mail() {
    var
    Service_id = 'service_fpdbuyt',
        Template_id = 'template_ll7mt6h',
        User_id = 's8BPFicQhyWq8BeHp';
    var s = http.post(Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'origin': 'http:localhost',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'service_id': Service_id,
          'user_id': User_id,
          'template_id': Template_id,
          'template_params': {
            'name': widget.task.name,
            'message': _selectedStatus,
            'sender': widget.task.email
          }
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF880A35),
        title: Text('Printing Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('id: ${widget.task.id}'),
            Text('Type: ${widget.task.type}'),
            Text('Size: ${widget.task.size}'),
            Text('Paper Orientation: ${widget.task.paperorient}'),
            Text('Paper: ${widget.task.paper}'),
            Text('Description: ${widget.task.des}'),
            // Text('Quantity: ${widget.task.quantity}'),
            Text('Email: ${widget.task.email}'),
            Text('Name: ${widget.task.name}'),
            Text('Contact: ${widget.task.contact}'),
            // Text('printer Name: ${widget.userEmail}'),
            // Text('Designer Contact: ${_user?.contact ?? 'N/A'}'),

            SizedBox(height: 20),

            DropdownButton<String>(
              value: _selectedStatus,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedStatus = newValue;
                  });
                }
              },
              items: <String>['', 'Pending', 'Completed']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            ElevatedButton(
              onPressed: () async {
                await updatePrinterStatus();
                Send_mail();
                Navigator.pop(context, _selectedStatus);
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
              child: Text('Save Status'),
            ),
          ],
        ),
      ),
    );
  }
}

