// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, unused_element, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class InfoEmpresas extends StatefulWidget {
  String nombreEmpresa, objetivoEmpresa, mision, vision, anio, lugar, email;
  InfoEmpresas(
      {Key? key,
      required this.nombreEmpresa,
      required this.objetivoEmpresa,
      required this.mision,
      required this.vision,
      required this.anio,
      required this.lugar,
      required this.email})
      : super(key: key);

  @override
  _InfoEmpresasState createState() => _InfoEmpresasState();
}

class _InfoEmpresasState extends State<InfoEmpresas> {
  final TextEditingController _dinero = TextEditingController();
  bool valido = false;
  double valor = 0;
  String compensacion = "";

  void _showAlertDialog(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'AVISO',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                'Debe ingresar el valor de la aportación',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  void _showAlertDialogConfirm(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'AVISO',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                '¡Gracias por tu donación!',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("E6F9EA"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            child: Image.asset(
              'assets/logo.PNG',
              width: 100,
            ),
          ),
        ],
        backgroundColor: HexColor("00BA32"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Text(
          "Organizaciones",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
            child: Image.asset(
              'assets/naturaleza.png',
              alignment: Alignment.center,
              width: 100,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
              color: HexColor("FFAA00"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Card(
                      color: HexColor("D2FF96"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(25.0),
                              child: Text(
                                widget.nombreEmpresa,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.objetivoEmpresa,
                                textAlign: TextAlign.justify,
                              ),
                              padding: EdgeInsets.all(20.0),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Misión:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                widget.mision,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Visión:",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                widget.vision,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Año de Dependencia:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                widget.anio,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              // ignore: prefer_const_constructors
                              child: Text(
                                "Lugar donde radica:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                widget.lugar,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "¿Deseas aportar con una donación?",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Text("Cantidad de dinero:"),
                ),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: null,
                    maxLines: null,
                    decoration: InputDecoration(
                        label: Text(
                      "Ingrese valor",
                    )),
                    controller: _dinero,
                  ),
                ),
                Flexible(
                  child: Text("USD"),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Text("Compensación generada:"),
                ),
                Flexible(
                    child: Text(
                  '$compensacion',
                  style: TextStyle(fontSize: 18.0),
                )),
                Flexible(
                  child: Text("%"),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60.0, 50.0, 60.0, 5.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(HexColor("FFAA00")),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "VALIDAR COMPENSACIÓN",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
              onPressed: () {
                _generar();
                setState(() {
                  valido = true;
                });
              },
            ),
          ),
          if (valido == true && _dinero.text.isNotEmpty)
            Container(
              padding: EdgeInsets.fromLTRB(60.0, 5.0, 60.0, 50.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(HexColor("FFAA00")),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "COMPENSAR",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  _sendDataEmpresas(context);
                  _showAlertDialogConfirm(context);
                },
              ),
            )
        ],
      ),
    );
  }

  void _generar() {
    if (_dinero.text.isEmpty) {
      _showAlertDialog(context);
    } else {
      valor = double.parse(_dinero.text);
      setState(() {
        if (valor == 0) {
          compensacion = "0";
        } else if ((valor >= 1.00 || valor >= 01.00) && valor <= 20.00) {
          compensacion = "25";
        } else if (valor >= 21.00 && valor <= 40.00) {
          compensacion = "50";
        } else if (valor >= 41.00 && valor <= 60.00) {
          compensacion = "75";
        } else if (valor >= 61.00) {
          compensacion = "100";
        }
      });
    }
  }

  _sendDataEmpresas(BuildContext context) async {
    await Firebase.initializeApp();
    if (_dinero.text.isNotEmpty) {
      FirebaseFirestore.instance
          .collection("Organizaciones")
          .doc("organizaciones")
          .collection("Compensaciones")
          .add({
        'email': widget.email,
        'organizacion': widget.nombreEmpresa,
        'cantidad dinero': _dinero.text,
        'compensacion': compensacion
      });
    } else {
      _showAlertDialog(context);
    }
  }
}
