import 'dart:convert';
import 'package:carbono_app/Screens/home.dart';
import 'package:carbono_app/Screens/tasks.dart';
import 'package:carbono_app/api/api_service.dart';
import 'package:carbono_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  
  Login();
  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _LoginState();
  
  
  final UserService uservice = UserService();

  bool secretPass = true;
  final _emailController = new TextEditingController();
  final _passController = new TextEditingController();
  final _addFormKey = GlobalKey<FormState>();
  
  
   //Users user;
   Future <Map<String, dynamic>> getUsersLogin (String email, String password) async {
    // ignore: unused_local_variable, unnecessary_cast
    Response res = await get(Uri.https("carbonoapp.herokuapp.com", '/user/$email&$password'));
    if (res.statusCode == 200) {
      Map<String, dynamic> data = Map<String, dynamic>.from(json.decode(res.body));
      if (data.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(email: _emailController.text,)));
      } else {
        _showAlertDialog(context);
        print("usuario no válido");
      }
      return data;
    } else {
      throw Exception("Falló nuevo usuario");
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'AVISO',
          textAlign: TextAlign.center,
        ),
        content: const Text(
          '¡Email y/o contraseña incorrectos!\n Por favor, ingrese nuevamente sus credenciales',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          foregroundColor: Color(0xff003F72),
          title: Text(
            "Iniciar Sesión:",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        body: Center(
          child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                    color: Color(0x1A003F72), spreadRadius: 1, blurRadius: 25),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            height: 400,
            width: 350,
          padding: EdgeInsets.all(35.0),
          child: Form(
          key: _addFormKey,
          child: ListView(
            //padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Email:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese su Email';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    obscureText: secretPass,
                    keyboardType: TextInputType.visiblePassword,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          !secretPass ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            secretPass = !secretPass;
                          });
                        },
                      ),
                      labelText: "Contraseña:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _passController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese su Password';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.only(top: 60),
                padding: EdgeInsets.all(45.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff003F72)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Iniciar Sesión",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    getUsersLogin(_emailController.text, _passController.text);
                  },
                ),
              )
            ],
          ),
        ),
        ),
        ));
  }
}