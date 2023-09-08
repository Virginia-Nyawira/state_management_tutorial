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
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Incremented"),
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                  duration: const Duration(milliseconds: 1000),
                  backgroundColor: Colors.green[300],
                ));
              },
              child: Container(
                color: Colors.lime[300],
                height: 100,
                width: 100,
                child: const Text('Tap tap!'),
              ),
            ),
            GestureDetector(
              onTap: (){
                getXController.decreaseX();
                print(getXController.x);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("Decremented"),
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                  duration: const Duration(milliseconds: 1000),
                  backgroundColor: Colors.green[800],
                ));
              },
              child: const Card(
                child: Text('Tap tap!'),
              ),
            ),
            Text(getXController.x.toString()),
          ],
        ),
      ),
    );
  }
}
