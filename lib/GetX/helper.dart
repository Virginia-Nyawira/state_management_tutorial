
 import 'package:get/get.dart';
import 'package:states/GetX/Controller/getx_controller.dart';
import 'package:states/GetX/Controller/list_controller.dart';

class InitDep implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TapController());
    Get.lazyPut(() => ListController());
    // TODO: implement dependencies
  }

}