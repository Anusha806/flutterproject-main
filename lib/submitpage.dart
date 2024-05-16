// import 'package:flutter/material.dart';
// import 'DatabaseSetup.dart';
//
// class SubmitPage extends StatefulWidget {
//   final String name;
//   final String id;
//   final String email;
//
//   const SubmitPage({Key? key, required this.name, required this.id, required this.email}) : super(key: key);
//
//   @override
//   State<SubmitPage> createState() => _SubmitPageState();
// }
//
// class _SubmitPageState extends State<SubmitPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Submit Page'),
//         titleTextStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//         backgroundColor: Colors.blue, // Added background color for the AppBar
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Name: ${widget.name}'),
//             Text('ID: ${widget.id}'),
//             Text('Email: ${widget.email}'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _insertData();
//   }
//
//   void _insertData() async {
//     DatabaseSetup databaseSetup = DatabaseSetup(
//       host: 'localhost',
//       port: 27017, // Default MongoDB port
//     );
//     await databaseSetup.insertData(widget.name, widget.id, widget.email);
//     Navigator.pop(context); // Go back to the previous page after inserting data
//   }
// }
