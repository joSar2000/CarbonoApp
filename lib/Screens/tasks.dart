// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_element, must_be_immutable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Task extends StatefulWidget {
  const Task({
    Key? key,
  }) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("E6F9EA"),
      body: Center(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
            child: CircularPercentIndicator(
              animationDuration: 600,
              animation: true,
              progressColor: Colors.green,
              radius: 100.0,
              lineWidth: 20.0,
              percent: 0.8,
              center: Text(
                "Progreso\nTotal",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
                  child: CircularPercentIndicator(
                    animationDuration: 600,
                    animation: true,
                    progressColor: Colors.green,
                    radius: 75.0,
                    lineWidth: 20.0,
                    percent: 0.2,
                    center: Text(
                      "Entorno",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
                  child: CircularPercentIndicator(
                    animationDuration: 600,
                    animation: true,
                    progressColor: Colors.green,
                    radius: 75.0,
                    lineWidth: 20.0,
                    percent: 0.5,
                    center: Text(
                      "Hogar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Actividades",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Card(
                    color: HexColor("FFAA00"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Accede a las actividades",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Flexible(
                            child: Icon(
                              Icons.local_activity,
                              semanticLabel:
                                  "Pulse para acceder a las actividades",
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
