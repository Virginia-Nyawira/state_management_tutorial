import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TapController extends GetxController{
  int _x=10;
  RxInt _y=0.obs;
  RxInt _z=0.obs;

  get x => _x;
  get y =>_y.value;
  get z => _z.value;

  void increaseX(){
    _x++;
    update();
  }

  void decreaseX(){
    _x--;
    update();
  }

  void increaseY(){
    _y.value++;
  }
  void addXY(){
    _z.value =_x+_y.value;

  }

}