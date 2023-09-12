import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/GetX/Controller/getx_controller.dart';
import 'package:states/GetX/Presentation/third_page.dart';
class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    TapController tapController= Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Page"),
      ),
      body: Column(
        children: [
          Container(
            width: 900,
            height: 200,
            color: Colors.tealAccent,
            child:  Center(
              child: IconButton(onPressed: (){
                Get.back();
              },
                  icon: const Icon(Icons.transit_enterexit,
                    color: Colors.red,
                    size: 38.0,),

              ),
            ),
          ),
          //Text(tapController.x.toString()),
          GetBuilder<TapController>(builder: (_)=>
              GestureDetector(
                onTap: (){
                  tapController.decreaseX();
                },
                child: Container(
                  width: 60,
                  color: Colors.orange,
                  child: Text(tapController.x.toString()),
                ),
              )),
          TextButton(onPressed: (){
            Get.to(()=>const ThirdPage());
          },
              child: const Text('Go to 3'))
        ],
      ),
    );
  }
}
