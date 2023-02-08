import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskTitle;
  final bool isTaskDone;

  Function(bool?)? onChecked;
  Function(BuildContext)? deleteTask;

  ToDoTile({
    super.key,
    required this.taskTitle,
    required this.isTaskDone,
    required this.onChecked,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete_forever,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              transform: GradientRotation(1.2),
              colors: [
                Colors.indigoAccent,
                Colors.black26,
                Colors.purpleAccent,
              ],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isTaskDone,
                onChanged: onChecked,
              ),
              Flexible(
                child: Text(
                  taskTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: isTaskDone ? FontStyle.italic : FontStyle.normal,
                    decoration: isTaskDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
