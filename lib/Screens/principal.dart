import 'package:carbono_app/Screens/login.dart';
import 'package:carbono_app/Screens/register.dart';
import 'package:flutter/material.dart';
import 'package:carbono_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(1),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("Bienvenido a",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300, fontSize: 23)),
                Text(
                  "CarbonoAPP",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500, fontSize: 36),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff003F72)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "INGRESAR",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFFFFFF)),
                        foregroundColor:
                            MaterialStateProperty.all(Color(0xff003F72)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Color(0xff003F72))))),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "REGISTRARSE",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}