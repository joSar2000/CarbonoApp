// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:carbono_app/Screens/infoEmpresas.dart';
import 'package:carbono_app/api/api_service.dart';
import 'package:carbono_app/models/empresas.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Donation extends StatefulWidget {
  String email;
  Donation({Key? key, required this.email}) : super(key: key);

  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  UserService empresaService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("E6F9EA"),
      body: FutureBuilder<List<EmpresasModel>>(
        future: empresaService.getAllEmpresas(),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoEmpresas(
                              nombreEmpresa: snapshot.data![index].nombreEmpresa
                                  .toString(),
                              objetivoEmpresa: snapshot
                                  .data![index].objetivoEmpresa
                                  .toString(),
                              mision: snapshot.data![index].mision.toString(),
                              vision: snapshot.data![index].vision.toString(),
                              anio: snapshot.data![index].anio.toString(),
                              lugar:
                                  snapshot.data![index].lugarRadica.toString(),
                              email: widget.email,
                            ),
                          ));
                    },
                    child: Column(
                      children: [
                        Card(
                          color: HexColor("D2FF96"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5.0,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Builder(
                                      builder: (context) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10.0),
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                snapshot
                                                    .data![index].nombreEmpresa
                                                    .toString(),
                                                textAlign: TextAlign.center,
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
                                                snapshot.data![index]
                                                    .objetivoEmpresa
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
                                                snapshot
                                                    .data![index].lugarRadica
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(
                                        18.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.navigate_next_outlined,
                                      size: 50.0,
                                    ))
                              ],
                            ),
                          ),
                        )
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
    );
  }
}
