import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted == true ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // if (a==5) {...} ---> a==5 ? DOĞRU : YANLIs --> ternary operation
            widget.task.type == Tasktype.notes
                ? Image.asset("lib/assets/images/category1.png")
                : widget.task.type == Tasktype.contest
                ? Image.asset("lib/assets/images/category2.png")
                : Image.asset("lib/assets/images/category3.png"),
            // Icon(Icons.notes_outlined, size: 50),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                       decoration: widget.task.isCompleted ?  TextDecoration.lineThrough : TextDecoration.none,
                       fontWeight: FontWeight.bold,
                       fontSize: 21
                       ),
                  ),
                  Text(widget.task.description,
                  style: TextStyle(
                    decoration: widget.task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                  ),
                ],
              ),
            ),

            Checkbox(
              value: isChecked,
              onChanged:
                  (val) => {
                    setState(() {
                      widget.task.isCompleted = !widget.task.isCompleted;
                      isChecked = val!;
                    }),
                  },
            ),
          ],
        ),
      ),
    );
  }
}
