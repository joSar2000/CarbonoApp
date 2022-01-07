// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_element, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class TaskInfo extends StatefulWidget {
  String titleTask, objetivo, body, recomendacion, bodyRec;
  int recompensa;
  TaskInfo(
      {Key? key,
      required this.titleTask,
      required this.objetivo,
      required this.body,
      required this.recompensa,
      required this.recomendacion,
      required this.bodyRec})
      : super(key: key);

  @override
  _TaskInfoState createState() => _TaskInfoState();
}

class Contamination {
  String? label;
  bool? active;
  Contamination(this.label, this.active);
}

class _TaskInfoState extends State<TaskInfo> {
  int optionGroup = 0, selectedItems=0;
  bool siVehiculo = false, noVehiculo = false, isSelected = false;
  List<String> _transporteList = [
    "Vehículo Particular",
    "Taxi",
    "Metro",
    "TroleBus",
    "Bus Urbano",
    "Bicicleta",
    "Scooter"
  ];
  List<Contamination> _contaminacionTransporte = [
    Contamination("Alta", false),
    Contamination("Media Alta", false),
    Contamination("Media", false),
    Contamination("Media Baja", false),
    Contamination("Baja", false),
  ];

  @override
  void initState() {
    super.initState();
    optionGroup = 0;
  }

  void _showAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'INFORMACIÓN',
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'Completa cada una de las tareas presentadas para obtener monedas de carbono',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  setValue(int val) {
    setState(() {
      optionGroup = val;
      if (optionGroup == 1) {
        siVehiculo = true;
        noVehiculo = false;
      } else if (optionGroup == 2) {
        siVehiculo = false;
        noVehiculo = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
        title: Text("Detalles de la Actividad"),
        centerTitle: true
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    widget.titleTask,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: FloatingActionButton(
                    tooltip: "Información",
                    mini: true,
                    onPressed: () {
                      _showAlertDialog(context);
                    },
                    child: Icon(Icons.info),
                    elevation: 6.0,
                    backgroundColor: Colors.lightGreen,
                  ),
                )
              ],
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Container(
            child: Text(
              widget.objetivo,
              textAlign: TextAlign.justify,
            ),
            padding: EdgeInsets.all(20.0),
          ),
          Center(
              child: Container(
            child: Text(widget.body),
            padding: EdgeInsets.all(20.0),
          )),
          Container(
            child: Card(
              color: Colors.lightGreen,
              borderOnForeground: true,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    "Recompensa para esta actividad: " +
                        widget.recompensa.toString() +
                        " PC",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            padding: EdgeInsets.all(15.0),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: FloatingActionButton(
                    heroTag: "like",
                    tooltip: "Me Gusta",
                    onPressed: () {
                      print("me gusta");
                    },
                    child: Icon(Icons.recommend),
                    elevation: 6.0,
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Container(
                  child: FloatingActionButton(
                    heroTag: "favorite",
                    tooltip: "Favorito",
                    onPressed: () {
                      print("me gusta");
                    },
                    child: Icon(Icons.star),
                    elevation: 6.0,
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Container(
                  child: FloatingActionButton(
                    heroTag: "insights",
                    tooltip: "Insignias",
                    onPressed: () {
                      print("me gusta");
                    },
                    child: Icon(Icons.insights_outlined),
                    elevation: 6.0,
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Card(
              color: Colors.lightGreen,
              borderOnForeground: true,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Recomendaciones",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      //color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Text(
                            widget.recomendacion.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      //color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Text(
                            widget.bodyRec.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            padding: EdgeInsets.all(15.0),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "¡COMENCEMOS!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Card(
              color: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "¿Utiliza algún medio de transporte diariamente?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            child: RadioListTile(
                              value: 1,
                              groupValue: optionGroup,
                              title: Text("SI"),
                              onChanged: (val) {
                                setValue(val as int);
                              },
                              activeColor: Colors.indigo,
                              selected: false,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            child: RadioListTile(
                              value: 2,
                              groupValue: optionGroup,
                              title: Text("NO"),
                              onChanged: (val) {
                                setValue(val as int);
                              },
                              activeColor: Colors.indigo,
                              selected: false,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "¿Qué tipo de transporte utiliza? (Escoger solo uno)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      children: techChips(),
                    ),
                    Text(
                      "¿Cuál crees que es la tasa de contaminación del medio de tranporte que utiliza?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      children: contaminationCheck(),
                    )
                  ],                
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  List<Widget> techChips () {
    List<Widget> chips = [];
    for (int i=0; i< _transporteList.length; i++) {
      Widget item = Padding(
        padding: EdgeInsets.all(1.0),
        child: ChoiceChip(        
          label: Text(_transporteList[i].toString()),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.amber,
          selected: selectedItems == i,
          onSelected: (bool value)
          {
            setState(() {
              selectedItems = i;
            });
          },
           avatar: CircleAvatar(
            child: Text(_transporteList[i].substring(0,1)
          ),
        ),
      ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> contaminationCheck () {
    List<Widget> checks = [];
    for (var i = 0; i < _contaminacionTransporte.length; i++) {
      Widget item = Padding(
        padding: EdgeInsets.all(0.0),
        child: CheckboxListTile(
          title: Text(_contaminacionTransporte[i].label.toString()),
          value: _contaminacionTransporte[i].active,
          onChanged: (value) {
            setState(() {
              _contaminacionTransporte[i].active = value;
            });
          },
        ),
      );
      checks.add(item);
    }
    return checks;
  }
}
