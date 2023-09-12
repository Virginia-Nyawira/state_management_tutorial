import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SimpleControllerPage extends StatefulWidget {
  const SimpleControllerPage({Key? key}) : super(key: key);

  @override
  State<SimpleControllerPage> createState() => _SimpleControllerPageState();
}

class _SimpleControllerPageState extends State<SimpleControllerPage> {

  final logic = Get.put(SimpleControllerLogic());
  final state = Get.find<SimpleControllerLogic>().simpleControllerState;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    Get.delete<SimpleControllerLogic>();
    super.dispose();
  }
}