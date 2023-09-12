import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/GetX/Presentation/simple/simple_controller/logic.dart';
import 'package:states/GetX/Presentation/simple/simple_prjt.dart';

class ViewActivities extends StatefulWidget {
  const ViewActivities({super.key});

  @override
  State<ViewActivities> createState() => _ViewActivitiesState();
}

class _ViewActivitiesState extends State<ViewActivities> {

  @override
  Widget build(BuildContext context) {
    SimpleControllerLogic controllerLogic = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Activities',
          style: titleStyle(),),
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
                title:Text(controllerLogic.myActivities[index].date as String ,
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
                subtitle: Text(controllerLogic.myActivities[index].time as String,
                  style: labelStyle().copyWith(
                    fontSize: 17.0,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.favorite,
                    // color: myList.contains(currentMovie)
                    //     ? Colors.pink[400]
                    //     : Colors.white,
                  ),
                )
              );

            }
        ),

      ),
    );
  }
}
