// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({ Key? key }) : super(key: key);

  @override
  _TaskHomeState createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Text("Detalles de la Actividad"),
          centerTitle: true),
      body: Center(
        child: Text("Programar funcionalidad Tipo Home"),
      ),
    );
  }
}