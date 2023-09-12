import 'package:get/get.dart';

import 'state.dart';

class SimpleControllerLogic extends GetxController {
  String _activity ='';
  String _date ='';
  String _time ='';

  List<String> activitiesList=[];

  void addToList(String item){
    activitiesList.add(item);
  }
  final SimpleControllerState simpleControllerState = SimpleControllerState();
}
