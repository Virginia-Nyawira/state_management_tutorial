import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      ),
      body: controllerLogic.activitiesList.isEmpty
          ? const Center(
        child: Text(
          'No activities',
          style: TextStyle(fontSize: 20),
        ),
      )
          :
      SizedBox(
        child: ListView.builder(
            itemCount: controllerLogic.activitiesList.length,
            itemBuilder: (context,index){
              return ListTile(
                leading: Text(controllerLogic.activitiesList[index],
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
                title:Text(controllerLogic.dateList[index],
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
                trailing: Text(controllerLogic.timeList[index],
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
              );

            }
        ),

      ),
    );
  }
}
