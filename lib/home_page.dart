import 'package:flutter/material.dart';

import 'package:todo_app/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ToDoTile(
            isTaskDone: false,
            taskTitle: "Test task 1",
            onChecked: null,
            deleteTask: null,
          ),
          ToDoTile(
            isTaskDone: true,
            taskTitle: "Test task 2",
            onChecked: null,
            deleteTask: null,
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
