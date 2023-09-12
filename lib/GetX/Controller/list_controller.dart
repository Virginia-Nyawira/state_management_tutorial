import 'package:get/get.dart';

class ListController extends GetxController{
  RxList _list=[].obs;
  RxList get List =>_list;

  void setValue(int x){
    _list.add(x);
    print(_list);
  }
}