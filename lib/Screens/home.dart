// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:carbono_app/Screens/donation.dart';
import 'package:carbono_app/Screens/encuesta.dart';
import 'package:carbono_app/Screens/tasks.dart';
import 'package:carbono_app/api/api_service.dart';
import 'package:carbono_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  String email;
  Home({Key? key, required this.email}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService _service = UserService();

  int _selectedIndex = 0;
  Users? users;

  @override
  void initState() {
    Data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Encuesta(
        email: widget.email,
        users: users,
      ),
      Task(),
      Donation(
        email: widget.email,
      ),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            child: Image.asset(
              'assets/logo.PNG',
              width: 100,
            ),
          ),
        ],
        backgroundColor: HexColor("D2FF96"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Text(
          "PachaKumir",
          style: TextStyle(
            color: HexColor("01200F"),
          ),
        ),
        centerTitle: true,
      ),
      body: tabs[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: HexColor("D2FF96"),
              ),
              accountName: Text(
                "Usuario",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                widget.email,
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.volunteer_activism_sharp),
              title: Text("Actividad Reciente"),
              onTap: () {
                print("object");
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
        backgroundColor: HexColor("D2FF96"),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        }, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            backgroundColor: HexColor("01200F"),
            icon: new Icon(
              Icons.task,
              color: HexColor("01200F"),
            ),
            title: new Text(
              'Encuesta',
              style: TextStyle(color: HexColor("01200F")),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: HexColor("01200F"),
            icon: new Icon(Icons.home, color: HexColor("01200F")),
            title: new Text(
              'Home',
              style: TextStyle(color: HexColor("01200F")),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: HexColor("01200F"),
            icon: new Icon(
              Icons.payment,
              color: HexColor("01200F"),
            ),
            title: new Text(
              'Donar',
              style: TextStyle(color: HexColor("01200F")),
            ),
          ),
        ],
      ),
    );
  }

  void Data() {
    FutureBuilder<List<Users>>(
      future: _service.getUsersByEmail(widget.email),
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
          return LayoutBuilder(
            builder: (context, constraints) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final userData = Users(
                      nombres: snapshot.data![index].nombres.toString(),
                      apellidos: snapshot.data![index].apellidos.toString(),
                      cedula: snapshot.data![index].cedula.toString(),
                      telefono: snapshot.data![index].telefono.toString(),
                      email: snapshot.data![index].email.toString(),
                      password: "",
                      nickName: snapshot.data![index].nickName.toString(),
                      cargo: snapshot.data![index].cargo.toString());
                  users = userData;

                  print(users);
                  return Text("daat");
                },
                itemCount: snapshot.data!.length,
              );
            },
          );
        } else {
          return Text("data");
        }
      },
    );
  }
}
