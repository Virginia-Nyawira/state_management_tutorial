import 'package:get/get.dart';

import 'state.dart';

class SimpleControllerLogic extends GetxController {

  List<String> activitiesList=[];
  List<String> dateList=[];
  List<String> timeList=[];

  void addActivity(String activity){
    activitiesList.add(activity);
    print(activitiesList);
  }
  void addDate(String date){
    dateList.add(date);
    print(dateList);
  }
  void addTime(String date){
    timeList.add(date);
    print(timeList);
  }
  final SimpleControllerState simpleControllerState = SimpleControllerState();
}
