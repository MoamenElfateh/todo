import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String? taskTitle;
  final Function checkboxCallback;
  final VoidCallback longpressCallback;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longpressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpressCallback,
      title: Text(
        taskTitle!,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Color(0xff757575),
        value: isChecked,
        onChanged: (bool? value) {
          checkboxCallback(value);
        },
      ),
    );
  }
}




// The idea here is that I give a value that may be (true or false) for this function[onChanged],
// and then you take this value and give it to this function[checkboxCallback] ,
// and then pass it as argument(checkboxState)