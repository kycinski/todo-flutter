import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback cancelTask;
  final VoidCallback saveTask;

  const TaskDialog({
    super.key,
    required this.controller,
    required this.cancelTask,
    required this.saveTask,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.blue[200],
      content: SizedBox(
        height: 150,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type a new task...',
                hintStyle: const TextStyle(
                  color: Colors.black38,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TaskDialogButton(
                  text: 'Cancel',
                  icon: Icons.cancel_outlined,
                  color: Colors.red,
                  onPressed: cancelTask,
                ),
                TaskDialogButton(
                  text: 'Save',
                  icon: Icons.check_circle,
                  color: Colors.green,
                  onPressed: saveTask,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TaskDialogButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final void Function()? onPressed;

  const TaskDialogButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: const Size(120, 50),
        elevation: 0,
        backgroundColor: color,
      ),
    );
  }
}
