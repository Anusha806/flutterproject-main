// import 'package:flutter/material.dart';
// import 'package:later/SubmitPage.dart'; // Make sure the import path matches your project structure
//
// class MyHomePage extends StatefulWidget {
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _id = '';
//   String _email = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('This is my Homepage'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   labelStyle: TextStyle(color: Colors.black),
//                 ),
//                 onChanged: (String value) {
//                   setState(() {
//                     _name = value;
//                   });
//                 },
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'ID',
//                   labelStyle: TextStyle(color: Colors.black),
//                 ),
//                 onChanged: (String value) {
//                   setState(() {
//                     _id = value;
//                   });
//                 },
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the ID';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   labelStyle: TextStyle(color: Colors.black),
//                 ),
//                 onChanged: (String value) {
//                   setState(() {
//                     _email = value;
//                   });
//                 },
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SubmitPage(
//                           name: _name,
//                           id: _id,
//                           email: _email,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:later/submitpage.dart';


import 'dbHelper/mongodb.dart'; // Adjust the import path accordingly

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _id = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                onChanged: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ID',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                onChanged: (String value) {
                  setState(() {
                    _id = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await MongoDatabase.insertData(_name, _id, _email);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubmitPage(
                            name: _name,
                            id: _id,
                            email: _email,
                          ),
                        ),
                      );
                    } catch (e) {
                      print('Error inserting data: $e');
                      // Handle the error appropriately, such as showing a dialog to the user
                    }
                  }
                },
                child: Text('Submit'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
