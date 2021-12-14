import 'package:carbono_app/Screens/login.dart';
import 'package:carbono_app/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carbono_app/models/user.dart';

class Register extends StatefulWidget {
  Register();

  // const Register({ this.users });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();
  final UserService userSer = UserService();

  final _addFormKey = GlobalKey<FormState>();
  final _namesController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _cedulaController = TextEditingController();
  final _telfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nickController = TextEditingController();
  final _cargoController = TextEditingController();

  bool secretPass = true;

  void _showAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'AVISO',
          textAlign: TextAlign.center,
        ),
        content: const Text(
          '¡Usuario Registrado con Éxito!\n Por favor, dirígete hacia la ventana principal para iniciar sesión',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Login())
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future save() async {
    if (_addFormKey.currentState!.validate()) {
      _addFormKey.currentState!.save();
      userSer.createUser(Users(
          nombres: _namesController.text,
          apellidos: _lastnameController.text,
          cedula: _cedulaController.text,
          telefono: _telfController.text,
          email: _emailController.text,
          password: _passController.text,
          nickName: _nickController.text,
          cargo: _cargoController.text));
      _showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          foregroundColor: Color(0xff003F72),
          title: Text(
            "Registrarse:",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400, fontSize: 18),
          ),
        ),
        body: Form(
          key: _addFormKey,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Nombres:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _namesController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese sus Nombres';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Apellidos:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _lastnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese sus Apellidos';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Cedula:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _cedulaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese su CI';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Teléfono:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _telfController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese sus Nombres';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
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
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "NickName:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _nickController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese su NickName';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: "Cargo:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _cargoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Porfavor, ingrese su Cargo';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Container(
                alignment: Alignment.centerRight,
                // margin: EdgeInsets.only(top: 60),
                padding: EdgeInsets.all(10),
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
                      "Registrarse",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    save();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
