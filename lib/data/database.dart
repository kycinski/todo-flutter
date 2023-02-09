import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _todoBox = Hive.box('todoBox');

  void loadData() {
    toDoList = _todoBox.get('todolist');
  }

  void updateDatabase() {
    _todoBox.put('todolist', toDoList);
  }
}
