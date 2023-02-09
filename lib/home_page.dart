import 'package:flutter/material.dart';

import 'package:todo_app/task_dialog.dart';
import 'package:todo_app/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [];

  final _taskTextController = TextEditingController();

  void checkBoxChanged(value, index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void cancelTask() {
    Navigator.of(context).pop();
    _taskTextController.clear();
  }

  void saveTask() {
    setState(() {
      toDoList.add([_taskTextController.text, false]);
    });
    Navigator.of(context).pop();
    _taskTextController.clear();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TaskDialog(
          controller: _taskTextController,
          cancelTask: cancelTask,
          saveTask: saveTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
      ),
      body: toDoList.isEmpty
          ? const Center(
              heightFactor: 25,
              child: Text(
                'Nothing TO DO, add some tasks',
                style: TextStyle(color: Colors.white54, fontSize: 20),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskTitle: toDoList[index][0],
                  isTaskDone: toDoList[index][1],
                  onChecked: (value) => checkBoxChanged(value, index),
                  deleteTask: (context) => deleteTask(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
