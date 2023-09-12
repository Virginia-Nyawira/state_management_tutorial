import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/GetX/Controller/getx_controller.dart';
import 'package:states/GetX/Controller/list_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController controller=Get.find();
    ListController listController= Get.find();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 60,
              color: Colors.white12,
              child: Text("X value:     ${controller.x}"),
            ),
          ),
          Obx(() => SizedBox(
            height: 300,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Card(
                    color: Colors.deepPurple[700],
                    elevation: 10,
                    child: Text("Y value:     ${controller.y}",
                      style: const TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.increaseY();
                  },
                  child: const Card(
                    color: Colors.purple,
                    elevation: 10,
                    child: Text('Tap Y',
                      style:TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.addXY();
                  },
                  child: Card(
                    color: Colors.deepPurple[700],
                    elevation: 10,
                    child: Text("Total value",
                      style: const TextStyle(
                          color: Colors.white
                      ),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                  },
                  child: Card(
                    color: Colors.deepPurple[700],
                    elevation: 10,
                    child: Text(controller.z.toString(),
                      style: const TextStyle(
                          color: Colors.white
                      ),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    //add sum to the list
                   listController.setValue(Get.find<TapController>().z);
                  },
                  child: Card(
                    color: Colors.deepPurple[700],
                    elevation: 10,
                    child: Text("Total value to list added",
                      style: const TextStyle(
                          color: Colors.white
                      ),),
                  ),
                ),
              ],
            ),
          )
          )

        ],
      ),
    );
  }
}
