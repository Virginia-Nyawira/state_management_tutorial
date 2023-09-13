import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../simple_prjt.dart';
import 'logic.dart';

class ViewDone extends StatelessWidget {
  const ViewDone({super.key});

  @override
  Widget build(BuildContext context) {
    SimpleControllerLogic controllerLogic = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Done Activities',
          style: titleStyle(),),
        actions: [
          TextButton(onPressed: (){
            //Go to finished tasks
            Get.to(()=>const SimpleHome());
          },
              child: const Text("Exit"))
        ],
      ),
      body: controllerLogic.doneActivities.isEmpty
          ? const Center(
        child: Text(
          'No activities',
          style: TextStyle(fontSize: 20),
        ),
      )
          : SizedBox(
        child: ListView.builder(
            itemCount: controllerLogic.doneActivities.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: Text(controllerLogic.doneActivities[index].activity,
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
                title:Text(controllerLogic.doneActivities[index].date.toString(),
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
                trailing: Text(controllerLogic.doneActivities[index].time.toString(),
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
                // trailing: IconButton(
                //   onPressed: () {
                //     if (controllerLogic.doneActivities.contains(done)) {
                //       //add to done list
                //       controllerLogic.doneActivities.add(done);
                //       print('Added');
                //       print(done);
                //     }
                //
                //   },
                //   icon: Icon(
                //     Icons.favorite,
                //     color: controllerLogic.myActivities.contains(done)
                //         ? Colors.pink[400]
                //         : Colors.white,
                //   ),
                // )
              );

            }
        ),

      ),
    );
  }
}

