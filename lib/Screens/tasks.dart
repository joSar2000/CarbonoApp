import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({ Key? key }) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tareas"
        ),
      ),
    );
  }
}