// ignore_for_file: prefer_const_constructors

import 'package:carbono_app/Screens/donation.dart';
import 'package:carbono_app/Screens/encuesta.dart';
import 'package:carbono_app/Screens/home.dart';
import 'package:carbono_app/Screens/tasks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:carbono_app/Screens/principal.dart';

import 'Screens/principal.dart';

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Home(email: 'jesarmiento3@utpl.edu.ec',)
      body: Main(),
    );
  }
} 