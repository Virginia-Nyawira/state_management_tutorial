///Simple ToDo app implementing GetX state management

import 'package:flutter/material.dart';

//title style
TextStyle titleStyle(){
  return const TextStyle(
    fontSize: 18,
    color: Colors.black54,
    wordSpacing: 2,
  );
}
//Label style
TextStyle labelStyle(){
  return const TextStyle(
    fontSize: 12,
    color: Colors.blueGrey,
    wordSpacing: 2,
    fontStyle: FontStyle.italic,
  );
}

class SimpleHome extends StatefulWidget {
  const SimpleHome({super.key});

  @override
  State<SimpleHome> createState() => _SimpleHomeState();
}

class _SimpleHomeState extends State<SimpleHome> {
  TextEditingController _activityEditingController = TextEditingController();
  TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _timeEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    _activityEditingController.dispose();
    _timeEditingController.dispose();
    _dateEditingController.dispose();
    super.dispose();
  }
  void _saveForm(){
    if (_formKey.currentState!.validate()) {
      // Perform save operation here
      String activity = _activityEditingController.text;
      String date = _dateEditingController.text;
      String time = _timeEditingController.text;

      // Print the values for demonstration
      print('Activity: $activity');
      print('Date: $date');
      print('Time: $time');

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("My to dos", style:  titleStyle(),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
          children: [
            TextFormField(
              controller: _activityEditingController,
              decoration: InputDecoration(
                labelText: "Activity",
                labelStyle: labelStyle(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "Activity required!";
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _dateEditingController,
              decoration: InputDecoration(
                labelText: "Date",
                labelStyle: labelStyle(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "Date required!";
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _timeEditingController,
              decoration: InputDecoration(
                labelText: "Time",
                labelStyle: labelStyle(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "Time required!";
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(onPressed: (){
              _saveForm();
            },
                child: const Text("Save")
            )
          ],
        )),
      )
    );
  }
}
