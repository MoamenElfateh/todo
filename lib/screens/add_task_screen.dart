import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff212124),
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextField(controller: _controller, textAlign: TextAlign.center),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff212124),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  String newTaskTitle = _controller.text.trim();
                  if (newTaskTitle.isNotEmpty) {
                    Provider.of<TaskData>(
                      context,
                      listen: false,
                    ).addTask(newTaskTitle);
                    _controller.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text('Add', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// listen: false , This ensures that the provider doesn't attempt to rebuild the AddTaskScreen widget when you call the addTask method.