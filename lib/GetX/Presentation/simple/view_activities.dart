import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/GetX/Presentation/simple/simple_controller/done_activities.dart';
import 'package:states/GetX/Presentation/simple/simple_controller/logic.dart';
import 'package:states/GetX/Presentation/simple/simple_prjt.dart';

class ViewActivities extends StatelessWidget {
  const ViewActivities({super.key});

  @override
  Widget build(BuildContext context) {
    SimpleControllerLogic controllerLogic = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activities',
          style: titleStyle(),),
        actions: [
          TextButton(onPressed: (){
            //Go to finished tasks
            Get.to(()=> const ViewDone());

          },
              child: const Text("View Done"))
        ],
      ),
      body: controllerLogic.myActivities.isEmpty
          ? const Center(
        child: Text(
          'No activities',
          style: TextStyle(fontSize: 20),
        ),
      )
          :
      SizedBox(
        child: ListView.builder(
            itemCount: controllerLogic.myActivities.length,
            itemBuilder: (context,index){
              final done= controllerLogic.myActivities[index];
              return ListTile(
                  leading: Text(controllerLogic.myActivities[index].activity,
                    style: labelStyle().copyWith(
                      fontSize: 17.0,
                    ),
                  ),
                  title:Text(controllerLogic.myActivities[index].date.toString(),
                    style: labelStyle().copyWith(
                      fontSize: 17.0,
                    ),
                  ),
                  subtitle: Text(controllerLogic.myActivities[index].time.toString(),
                    style: labelStyle().copyWith(
                      fontSize: 17.0,
                    ),
                  ),
                  trailing:  IconButton(
                      onPressed: () {
                        if (controllerLogic.myActivities.contains(done)) {
                          if (controllerLogic.doneActivities.contains(done)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Item already added to done list'),
                              ),
                            );
                          } else {
                            //add to done list
                            controllerLogic.doneActivities.add(done);
                            print('Added');
                            print(done);
                          }

                        }
                      },
                      icon:
                      Icon(
                        Icons.check_box,
                        color: controllerLogic.doneActivities.contains(done)?
                        Colors.lightGreenAccent : Colors.grey,
                      )
                  )
              );

            }
        ),

      ),
    );
  }
}


