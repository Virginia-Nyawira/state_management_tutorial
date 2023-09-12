
 import 'package:get/get.dart';
import 'package:states/GetX/Controller/getx_controller.dart';
import 'package:states/GetX/Controller/list_controller.dart';

import 'Presentation/simple/simple_controller/logic.dart';

class InitDep implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TapController());
    Get.lazyPut(() => ListController());
    Get.lazyPut(() => SimpleControllerLogic());
    // TODO: implement dependencies
  }
}