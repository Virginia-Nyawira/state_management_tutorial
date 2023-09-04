import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/Provider/API_Call_using_Provider/Services/provider_service.dart';

class ProviderWithApi extends StatefulWidget {
  const ProviderWithApi({super.key});

  @override
  State<ProviderWithApi> createState() => _ProviderWithApiState();
}

class _ProviderWithApiState extends State<ProviderWithApi> {
  bool data= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ToDoProvider>(
          context, listen: false).getAllTodos();
      data = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API and Provider with tutorial"),
      ),
      body: Visibility(
        visible: data,
        replacement:const CircularProgressIndicator(),
        child: Consumer<ToDoProvider>(
          builder: (context, value, child){
            final todos= value.toDos;
            return ListView.builder(
                itemCount: value.toDos.length,
                itemBuilder: (context, index){
                  final todo= todos[index];
              return ListTile(

                leading: CircleAvatar(
                  child: Text(todo.id.toString()),
                ),
                title: Text(todo.title),
                subtitle: Text(todo.userId as String),
              );
            });
          },

        ),
      ),

    );
  }
}
