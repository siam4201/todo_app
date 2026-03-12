import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    required this.onDeleted,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(15),

        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              //checkColor: Colors.white,
              activeColor: Colors.white,
              side: BorderSide(color: Colors.white),
            ),
            Expanded(
              child: Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: onDeleted,
              child: Icon(Icons.delete),
              mini: true,
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
