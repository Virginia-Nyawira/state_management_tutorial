import 'package:flutter/material.dart';
import 'package:states/GetX/Controller/getx_controller.dart';

class GetxFirstHome extends StatefulWidget {
  const GetxFirstHome({super.key});

  @override
  State<GetxFirstHome> createState() => _GetxFirstHomeState();
}

class _GetxFirstHomeState extends State<GetxFirstHome> {
  GetXController getXController= GetXController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                getXController.increaseX();
                print(getXController.x);
              },
              child: const Card(
                child: Text('Tap tap!'),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: const Card(
                child: Text('Tap tap!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
