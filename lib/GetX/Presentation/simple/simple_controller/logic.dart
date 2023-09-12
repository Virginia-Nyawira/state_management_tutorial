import 'package:get/get.dart';

import 'state.dart';

class MyActivities{
  final String activity;
  final int date;
 final int time;

 MyActivities({required this.activity, required this.date, required this.time});
}

class SimpleControllerLogic extends GetxController {

 List<MyActivities> myActivities= <MyActivities>[];
  void addToDo(MyActivities activities){
    myActivities.add(activities);
  }

  final SimpleControllerState simpleControllerState = SimpleControllerState();
}
