import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
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
    );
  }
}
