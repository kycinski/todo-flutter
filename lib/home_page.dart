import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';

import 'package:todo_app/task_dialog.dart';
import 'package:todo_app/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    try {
      db.loadData();
    } catch (e) {
      return;
    }
    super.initState();
  }

  final _taskTextController = TextEditingController();

  void checkBoxChanged(value, index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void deleteTask(index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  void cancelTask() {
    Navigator.of(context).pop();
    _taskTextController.clear();
  }

  void saveTask() {
    if (_taskTextController.text.isNotEmpty) {
      setState(() {
        db.toDoList.add([_taskTextController.text, false]);
      });
      Navigator.of(context).pop();
      _taskTextController.clear();
      db.updateDatabase();
    }
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
      body: db.toDoList.isEmpty
          ? const Center(
              heightFactor: 25,
              child: Text(
                'Nothing TO DO, add some tasks',
                style: TextStyle(color: Colors.white54, fontSize: 20),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskTitle: db.toDoList[index][0],
                  isTaskDone: db.toDoList[index][1],
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
