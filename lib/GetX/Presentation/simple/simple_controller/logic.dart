import 'package:get/get.dart';

import 'state.dart';

class MyActivities{
  final String activity;
  var date;
 num time;

 MyActivities({required this.activity, required this.date, required this.time});
}

class SimpleControllerLogic extends GetxController {

 List<MyActivities> myActivities= <MyActivities>[];
 List<MyActivities> doneActivities= <MyActivities>[];
  void addToDo(MyActivities activities){
    myActivities.add(activities);
    print(myActivities);
  }

  void addDoneToDo(MyActivities activities){
    doneActivities.add(activities);
    print(doneActivities);
  }

  final SimpleControllerState simpleControllerState = SimpleControllerState();
}
