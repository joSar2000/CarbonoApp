// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_element, must_be_immutable

import 'package:carbono_app/Screens/activities.dart';
import 'package:carbono_app/Screens/principal.dart';
import 'package:carbono_app/Screens/taskInfo.dart';
import 'package:carbono_app/api/api_service.dart';
import 'package:carbono_app/models/task.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  String email;
  Task({
    Key? key,
    required this.email
  }) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final UserService userService = UserService();
  List<TaskModel> listModel = [];
  int boton = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
        title: Text("Tareas"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TaskModel>>(
        future: userService.getAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(7.0),
                  child: InkWell(
                    onTap: () {
                      if (boton == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskInfo(
                                    titleTask: snapshot.data![index].titleTask
                                        .toString(),
                                    objetivo: snapshot.data![index].objetivo
                                        .toString(),
                                    body: snapshot.data![index].body.toString(),
                                    recompensa: snapshot
                                        .data![index].recompensa!
                                        .toInt(),
                                    recomendacion: snapshot
                                        .data![index].recomendaciones!.title
                                        .toString(),
                                    bodyRec: snapshot
                                        .data![index].recomendaciones!.bodyRec
                                        .toString(),
                                        email: widget.email,
                                  )));
                      } else {
                        print ("Debes irte a otra pagina");
                      }
                    },
                    child: Column(
                      children: <Widget> [
                        Card(
                          elevation: 5.0,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Image.network(
                                    'https://thumbs.dreamstime.com/b/hoja-6-4147325.jpg',
                                    cacheHeight: 50,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    child: Builder(builder: (context) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              snapshot.data![index].titleTask
                                                  .toString(),
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              "Objetivo:\n" +
                                                  snapshot.data![index].objetivo
                                                      .toString(),
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              "Recompensa: " +
                                                  snapshot.data![index].recompensa
                                                      .toString() +
                                                  " PC",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                                Container(
                                    padding:
                                        EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.navigate_next_outlined,
                                      size: 50.0,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return Text("data");
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Usuario"),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.volunteer_activism_sharp),
              title: Text("Actividad Reciente"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Activities(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre Nosotros"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Cerrar Sesión"),
              onTap: () {
                print("Salida");
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.calculate),
            title: new Text('Calculadora Ambiental'),
          ),
        ],
      ),
    );
  }
}
