// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {

  final Stream<QuerySnapshot> _data =
      FirebaseFirestore.instance.collection("TasksComplete").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: const Text("Actividad Reciente"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _data,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView (
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Nombres: " + document['Nombres'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 500,
                          ),
                          Text(
                            "Apellidos: " + document['Apellidos'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 500,
                          ),
                          Text(
                            "Email: " + document['Email'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 500,
                          ),
                          Text(
                            "Cargo: " + document['Cargo'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 500,
                          ),
                          Text(
                            "Actividad Realizada: " +
                                document['Actividad_Realizada'].toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
