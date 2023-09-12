///Simple ToDo app implementing GetX state management

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/GetX/Presentation/simple/simple_controller/logic.dart';

//title style
TextStyle titleStyle(){
  return const TextStyle(
    fontSize: 18,
    color: Colors.black54,
    fontWeight: FontWeight.w900,
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

  SimpleControllerLogic simpleControllerLogic= Get.find();

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
        centerTitle: true,
        title:  Text("My To Do-s", style:  titleStyle(),),
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

                }else{
                  simpleControllerLogic.addActivity(_activityEditingController.text);
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
                }else{
                  simpleControllerLogic.addDate(_dateEditingController.text);
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
                }else{
                  simpleControllerLogic.addTime(_timeEditingController.text);
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
