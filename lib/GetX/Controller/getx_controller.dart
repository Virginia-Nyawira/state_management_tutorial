import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TapController extends GetxController{
  int _x=10;

  get x => _x;

  void increaseX(){
    _x++;
  }

  void decreaseX(){
    _x--;
  }

}