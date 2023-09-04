import 'package:flutter/material.dart';
import 'package:states/Provider/API_Call_using_Provider/Model/to_do.dart';
import 'package:states/Provider/API_Call_using_Provider/Services/to_do_services.dart';

class ToDoProvider with ChangeNotifier{
  ToDoService _service= ToDoService();
  bool isLoaded=false;

  List<ToDo> _myToDos=[];
  List<ToDo> get toDos =>_myToDos;

  Future<void> getAllTodos () async{
    isLoaded=true;
    notifyListeners();

    final response =  await _service.getAll();

    _myToDos= response;
    isLoaded=false;
    notifyListeners();
  }

}