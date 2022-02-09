// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, prefer_final_fields, unused_field

import 'package:carbono_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Encuesta extends StatefulWidget {
  Users? users;
  String email;
  Encuesta({Key? key, required this.email, required this.users})
      : super(key: key);

  @override
  _EncuestaState createState() => _EncuestaState();
}

class _EncuestaState extends State<Encuesta> {
  double resultadoFinal = 0, valorPagar = 0;
  int selectedItems = 0,
      selectedItemsCombustible = 0,
      _optionGroupExt = 0,
      _optionGroupListEx = 0,
      _optionGroupEx6 = 0,
      _optionGroupEx7 = 0,
      _optionGroupEx8 = 0,
      _optionGroupEx9 = 0,
      _optionGroupCo10 = 0,
      _optionGroupCo12 = 0,
      _oprionGroup2 = 0,
      _generoNum = 0,
      _estadoCivil = 0,
      _nivelEducacion = 0,
      _actividadEconomica = 0,
      _ingresos = 0;
  String _finalTransporte = "",
      _finalCombustible = "",
      _finalExternalidad = "",
      _finalExt6 = "",
      _finalExt7 = "",
      _finalExt8 = "",
      _finalExt9 = "",
      _finalCom10 = "",
      _finalCom12 = "",
      _finalCivil = "",
      _finalEducacion = "",
      _finalEconomica = "",
      _finalIngresos = "",
      _finalGenero = "",
      _final2 = "";

  bool _selected = false, _generar = false;
  List<String> _transporteList = [
    "A pie",
    "Bicicleta",
    "Bus Público",
    "Moto",
    "Vehículo",
    "Otro, especifique"
  ];
  List<String> _cantidadCombustible = [
    "Gasolina",
    "Diesel",
    "Electricidad",
    "Gas",
    "Otro, especifique"
  ];
  List<String> _externalidad6 = ["Alto", "Medio", "Bajo"];
  List<String> _pregunta2 = ["Diariamente", "Semanalmente", "Mensualmente"];
  List<String> _externalidadesSN = ["SI", "NO", "NO SABE"];
  List<String> _externalidad8 = ["Positivas", "Negativas"];
  List<String> _compensacion10 = ["SI", "NO"];
  List<String> _genero = ["Femenino", "Masculino", "Otro, especifique"];
  List<String> _civil = [
    "Soltero/a",
    "Casado/a",
    "Divorciado/a",
    "Viudo/a",
    "Separado/a",
    "Unión Libre"
  ];
  List<String> _educacion = [
    "Primaria",
    "Secundaria",
    "Técnica",
    "Pregrado",
    "Posgrado"
  ];
  List<String> _economia = [
    "Empleado Privado",
    "Empleado Público",
    "Trabaja por cuenta propia",
    "Estudiante",
    "Jubilado",
    "Desempleado",
    "Otro, especifique"
  ];
  List<String> _ingresosEc = [
    "Menos o igual a 400 USD",
    "401 USD a 800 USD",
    "801 USD a 1200 USD",
    "1201 USD a 1600 USD",
    "1601 USD a 2000 USD",
    "2001 USD a 3000 USD",
    "Más de 3000 USD"
  ];

  bool _expanded = false,
      _expanded2 = false,
      _expanded3 = false,
      _siCom = false,
      _noCom = false;

  TextEditingController _motoControllerMarca = TextEditingController();
  TextEditingController _motoControllerModelo = TextEditingController();
  TextEditingController _motoControllerAnio = TextEditingController();
  TextEditingController _cantidadKilometros = TextEditingController();
  TextEditingController _cantidadPasajeros = TextEditingController();
  TextEditingController _cantidadGalones = TextEditingController();
  TextEditingController _compensacionText10 = TextEditingController();
  TextEditingController _compensacionText11 = TextEditingController();
  TextEditingController _compensacionText12 = TextEditingController();
  TextEditingController _compensacionText13 = TextEditingController();
  TextEditingController _edadText = TextEditingController();
  TextEditingController _generoOtro = TextEditingController();
  TextEditingController _economiaOtro = TextEditingController();

  @override
  void initState() {
    super.initState();
    _optionGroupExt = 0;
    _optionGroupListEx = 0;
    _optionGroupEx6 = 0;
    _optionGroupEx7 = 0;
    _optionGroupEx8 = 0;
    _optionGroupEx9 = 0;
    _optionGroupCo10 = 0;
    _optionGroupCo12 = 0;
    _oprionGroup2 = 0;
    _estadoCivil = 0;
    _nivelEducacion = 0;
    _actividadEconomica = 0;
    _ingresos = 0;
    _generoNum = 0;
  }

  void _showAlertDialogNoData(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'AVISO',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                'Campos incompletos\nPor favor, ingresa la información correspondiente dentro del apartado de Kilómetros y Galones',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK', textAlign: TextAlign.center),
                ),
              ],
            ));
  }

  void _showAlertDialogNoDataValo(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'AVISO',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                'Campos incompletos\nPor favor, ingresa la información correspondiente para validar la misma',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK', textAlign: TextAlign.center),
                ),
              ],
            ));
  }

  void _showAlertDialogNoDataInfo(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'AVISO',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                'Campos incompletos\nPor favor, ingresa la información correspondiente sobre su información personal',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK', textAlign: TextAlign.center),
                ),
              ],
            ));
  }

  void _showAlertDialogCompensar(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'AVISO',
                textAlign: TextAlign.center,
              ),
              content: const Text(
                '¡Gracias por tu colaboración!',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK', textAlign: TextAlign.center),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            color: Colors.green,
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              elevation: 1,
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'A. HÁBITOS Y PERCEPCIÓN',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  body: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "CÁLCULO DE EMISIONES",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Qué tipo de transporte utiliza habitualmente para transportarse?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: techChips(),
                        ),
                        if (_selected == true)
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text("Ingrese la marca")),
                              maxLength: null,
                              controller: _motoControllerMarca,
                              enabled: _selected,
                            ),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        if (_selected == true)
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text("Ingrese el modelo")),
                              maxLength: null,
                              controller: _motoControllerModelo,
                              enabled: _selected,
                            ),
                          ),
                        if (_selected == true)
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: Text("Ingrese el Año")),
                              maxLength: null,
                              controller: _motoControllerAnio,
                              enabled: _selected,
                            ),
                          ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Cuántos kilómetros recorre con el medio de transporte señalado en la pregunta 1 (aproximadamente)? Seleccione la frecuencia que le sea más fácil responder",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: lista2(),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                label: Text("Ingrese cantidad de kilómetros")),
                            maxLength: null,
                            controller: _cantidadKilometros,
                            enabled: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Cuál es el número de pasajeros que van con usted en el transporte normalmente?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                label: Text("Ingrese número de pasajeros")),
                            maxLength: null,
                            controller: _cantidadPasajeros,
                            enabled: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Si cuenta con medio de transporte propio, ¿cuál y cuánta cantidad de los siguientes combustibles consume?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: listaCombustible(),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                label: Text("Ingrese cantidad de galones")),
                            maxLength: null,
                            controller: _cantidadGalones,
                            enabled: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "EXTERNALIDADES",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Cree usted que el transporte vehicular contamina el ambiente?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: listaExtSN(),
                        ),
                        if (_optionGroupListEx == 0)
                          Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "¿En qué nivel de contaminación ubica al transporte vehícular? ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (_optionGroupListEx == 0)
                          Wrap(
                            children: listaExt6(),
                          ),
                        if (_optionGroupListEx == 0 ||
                            _optionGroupListEx == 1 ||
                            _optionGroupListEx == 2)
                          Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "¿Conoce usted en qué consisten las externalidades?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        Wrap(
                          children: listaEx7(),
                        ),
                        if (_optionGroupEx7 == 0)
                          Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "¿Cómo considera a las externalidades ambientales que genera el tránsito vehicular?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (_optionGroupEx7 == 0)
                          Wrap(
                            children: listaEx8(),
                          ),
                        if (_optionGroupEx7 == 0)
                          Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "¿Cree usted que el Estado intenta o ha intendado mitigar o compensar los efectos de externalidades negativas que genera el tránsito vehicular?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        if (_optionGroupEx7 == 0)
                          Wrap(
                            children: listaEx9(),
                          )
                      ],
                    ),
                  ),
                  isExpanded: _expanded,
                  canTapOnHeader: true,
                ),
              ],
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                _expanded = !_expanded;
                setState(() {});
              },
            ),
          ),
          Container(
              margin: EdgeInsets.all(15.0),
              color: Colors.green,
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 1000),
                elevation: 1,
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(
                          'B. VALORACIÓN ECONÓMICA',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    body: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "COMPENSACIÓN ECONÓMICA",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "¿Estaría dispuesto a compensar por  la emisiones de CO2 vehícular que emite?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Wrap(
                            children: listaCom10(),
                          ),
                          if (_optionGroupCo10 == 1)
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: TextFormField(
                                maxLines: null,
                                decoration: InputDecoration(
                                    label: Text("¿Por qué no?")),
                                maxLength: null,
                                controller: _compensacionText10,
                              ),
                            ),
                          if (_optionGroupCo10 == 0)
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "¿Cuánto estaría dispuesto a compensar por cada unidad de CO2 vehícular emitida?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          if (_optionGroupCo10 == 0)
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLines: null,
                                decoration: InputDecoration(
                                    label: Text("Ingrese cantidad USD")),
                                maxLength: null,
                                controller: _compensacionText11,
                              ),
                            ),
                          if (_optionGroupCo10 == 1 || _optionGroupCo10 == 0)
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Si tuviera que realizar una compensación, ¿estaría dispuesta a cambiar su medio de transporte diario por uno que evite las emisiones de CO2?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          if (_optionGroupCo10 == 1 || _optionGroupCo10 == 0)
                            Wrap(
                              children: listaCom12(),
                            ),
                          if (_optionGroupCo12 == 1)
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: TextFormField(
                                maxLines: null,
                                decoration: InputDecoration(
                                    label: Text("¿Por qué no?")),
                                maxLength: null,
                                controller: _compensacionText12,
                              ),
                            ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "¿Qué otra acción, diferente a la indicada estaría dispuesto a realizar para reducir la contaminación vehicular?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              maxLines: null,
                              decoration: InputDecoration(
                                  label: Text("Escriba su respuesta")),
                              maxLength: null,
                              controller: _compensacionText13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _expanded2,
                    canTapOnHeader: true,
                  )
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded2 = !_expanded2;
                  setState(() {});
                },
              )),
          Container(
            margin: EdgeInsets.all(15.0),
            color: Colors.green,
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 1000),
              elevation: 1,
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'C. INFORMACIÓN SOCIODEMOGRÁFICA',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  body: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "DATOS SOCIODEMOGRÁFICOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Qué edad tiene?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            decoration: InputDecoration(
                                label: Text("Escriba su edad (Años)")),
                            maxLength: null,
                            controller: _edadText,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Cuál es su género?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: listaGenero(),
                        ),
                        if (_generoNum == 2)
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              maxLines: null,
                              decoration:
                                  InputDecoration(label: Text("Especifique")),
                              maxLength: null,
                              controller: _generoOtro,
                            ),
                          ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Cuál es su estado civil?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: listaCivil(),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Cuál es su nivel de educación?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: listaEducacion(),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿Cuál es su pirncipal actividad económica?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: listaEconomia(),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "¿En qué rango están ubicados sus ingresos mensuales?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Wrap(
                          children: listaIngresos(),
                        )
                      ],
                    ),
                  ),
                  isExpanded: _expanded3,
                  canTapOnHeader: true,
                )
              ],
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                _expanded3 = !_expanded3;
                setState(() {});
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Valor del Cálculo: $resultadoFinal",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(50.0),
                  child: FloatingActionButton(
                    heroTag: Text("1"),
                    child: Icon(Icons.calculate),
                    elevation: 5.0,
                    onPressed: () {
                      CalcularEmision();
                      setState(() {
                        _generar = true;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "¿Está dispuesto a compensar $valorPagar USD por su huella de carbono generada?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (_generar == true &&
              _cantidadGalones.text.isNotEmpty &&
              _cantidadKilometros.text.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    child: Container(
                  padding: EdgeInsets.all(50.0),
                  child: FloatingActionButton(
                    heroTag: Text("2"),
                    child: Icon(Icons.check),
                    elevation: 5.0,
                    onPressed: () {
                      setState(() {
                        _siCom = true;
                        _noCom = false;
                        _showAlertDialogCompensar(context);
                      });
                    },
                  ),
                )),
                Flexible(
                    child: Container(
                  padding: EdgeInsets.all(50.0),
                  child: FloatingActionButton(
                    heroTag: Text("3"),
                    child: Icon(Icons.disabled_by_default),
                    elevation: 5.0,
                    onPressed: () {
                      setState(() {
                        _noCom = true;
                        _siCom = false;
                        _showAlertDialogCompensar(context);
                      });
                    },
                  ),
                ))
              ],
            ),
          if (_siCom == true || _noCom == true)
            Container(
              padding: EdgeInsets.fromLTRB(80.0, 10.0, 80.0, 20.0),
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
                    "ENVIAR",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  _showAlertDialogCompensar(context);
                  _sendDataHabits(context);
                  _sendDataValoracion(context);
                  _sendDataInfo(context);
                  _sendCompensacion(context);
                },
              ),
            )
        ],
      ),
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _transporteList.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_transporteList[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: HexColor("FFAA00"),
            selected: selectedItems == i,
            onSelected: (bool value) {
              setState(() {
                selectedItems = i;
                _finalTransporte = _transporteList[i].toString();
                if (selectedItems == 3 ||
                    selectedItems == 4 ||
                    selectedItems == 5) {
                  _selected = true;
                } else {
                  _selected = false;
                }
              });
            },
            avatar: CircleAvatar(
              backgroundColor: HexColor("2E5266"),
              child: Text(
                _transporteList[i].substring(0, 1),
              ),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> lista2() {
    List<Widget> chips = [];
    for (int i = 0; i < _pregunta2.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_pregunta2[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _oprionGroup2 == i,
            onSelected: (bool value) {
              setState(() {
                _oprionGroup2 = i;
                _final2 = _pregunta2[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_pregunta2[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaCombustible() {
    List<Widget> chips = [];
    for (int i = 0; i < _cantidadCombustible.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_cantidadCombustible[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: selectedItemsCombustible == i,
            onSelected: (bool value) {
              setState(() {
                selectedItemsCombustible = i;
                _finalCombustible = _cantidadCombustible[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_cantidadCombustible[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaExtSN() {
    List<Widget> chips = [];
    for (int i = 0; i < _externalidadesSN.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_externalidadesSN[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _optionGroupListEx == i,
            onSelected: (bool value) {
              setState(() {
                _optionGroupListEx = i;
                _finalExternalidad = _externalidadesSN[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_externalidadesSN[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaExt6() {
    List<Widget> chips = [];
    for (int i = 0; i < _externalidad6.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_externalidad6[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _optionGroupEx6 == i,
            onSelected: (bool value) {
              setState(() {
                _optionGroupEx6 = i;
                _finalExt6 = _externalidad6[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_externalidad6[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaEx7() {
    List<Widget> chips = [];
    for (int i = 0; i < _externalidadesSN.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_externalidadesSN[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _optionGroupEx7 == i,
            onSelected: (bool value) {
              setState(() {
                _optionGroupEx7 = i;
                _finalExt7 = _externalidadesSN[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_externalidadesSN[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaEx8() {
    List<Widget> chips = [];
    for (int i = 0; i < _externalidad8.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_externalidad8[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _optionGroupEx8 == i,
            onSelected: (bool value) {
              setState(() {
                _optionGroupEx8 = i;
                _finalExt8 = _externalidad8[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_externalidad8[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaEx9() {
    List<Widget> chips = [];
    for (int i = 0; i < _externalidadesSN.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_externalidadesSN[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _optionGroupEx9 == i,
            onSelected: (bool value) {
              setState(() {
                _optionGroupEx9 = i;
                _finalExt9 = _externalidadesSN[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_externalidadesSN[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaCom10() {
    List<Widget> chips = [];
    for (int i = 0; i < _compensacion10.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_compensacion10[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _optionGroupCo10 == i,
            onSelected: (bool value) {
              setState(() {
                _optionGroupCo10 = i;
                _finalCom10 = _compensacion10[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_compensacion10[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaCom12() {
    List<Widget> chips = [];
    for (int i = 0; i < _compensacion10.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_compensacion10[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _optionGroupCo12 == i,
            onSelected: (bool value) {
              setState(() {
                _optionGroupCo12 = i;
                _finalCom12 = _compensacion10[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_compensacion10[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaGenero() {
    List<Widget> chips = [];
    for (int i = 0; i < _genero.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_genero[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _generoNum == i,
            onSelected: (bool value) {
              setState(() {
                _generoNum = i;
                _finalGenero = _genero[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_genero[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaCivil() {
    List<Widget> chips = [];
    for (int i = 0; i < _civil.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_civil[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _estadoCivil == i,
            onSelected: (bool value) {
              setState(() {
                _estadoCivil = i;
                _finalCivil = _civil[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_civil[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaEducacion() {
    List<Widget> chips = [];
    for (int i = 0; i < _educacion.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_educacion[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _nivelEducacion == i,
            onSelected: (bool value) {
              setState(() {
                _nivelEducacion = i;
                _finalEducacion = _educacion[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_educacion[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaEconomia() {
    List<Widget> chips = [];
    for (int i = 0; i < _economia.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_economia[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _actividadEconomica == i,
            onSelected: (bool value) {
              setState(() {
                _actividadEconomica = i;
                _finalEconomica = _economia[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_economia[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> listaIngresos() {
    List<Widget> chips = [];
    for (int i = 0; i < _ingresosEc.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(1.0),
          child: ChoiceChip(
            label: Text(_ingresosEc[i].toString()),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.amber,
            selected: _ingresos == i,
            onSelected: (bool value) {
              setState(() {
                _ingresos = i;
                _finalIngresos = _ingresosEc[i].toString();
              });
            },
            avatar: CircleAvatar(
              child: Text(_ingresosEc[i].substring(0, 1)),
            ),
          ));
      chips.add(item);
    }
    return chips;
  }

  CalcularEmision() {
    if (_cantidadGalones.text.isNotEmpty &&
        _cantidadKilometros.text.isNotEmpty) {
      double valorGalones = double.parse(_cantidadGalones.text);
      double valorKilometros = double.parse(_cantidadKilometros.text);
      setState(() {
        if (selectedItems == 1 ||
            selectedItems == 2 ||
            selectedItems == 3 ||
            selectedItems == 4 ||
            selectedItems == 5) {
          if (selectedItemsCombustible == 0) {
            resultadoFinal = ((2.244) * valorGalones) * valorKilometros;
          } else if (selectedItemsCombustible == 1) {
            resultadoFinal = ((2.459) * valorGalones) * valorKilometros;
          } else if (selectedItemsCombustible == 2) {
            resultadoFinal = 0;
          } else if (selectedItemsCombustible == 3) {
            resultadoFinal = ((2.698) * valorGalones) * valorKilometros;
          } else if (selectedItemsCombustible == 4) {
            resultadoFinal = ((2.244) * valorGalones) * valorKilometros;
          }
        }

        if (resultadoFinal >= 0 && resultadoFinal <= 50) {
          valorPagar = 10.0;
        } else if (resultadoFinal >= 51 && resultadoFinal <= 100) {
          valorPagar = 20.0;
        } else if (resultadoFinal >= 101 && resultadoFinal <= 200) {
          valorPagar = 25.0;
        } else if (resultadoFinal >= 201 && resultadoFinal <= 300) {
          valorPagar = 30.0;
        } else if (resultadoFinal >= 301 && resultadoFinal <= 400) {
          valorPagar = 35.0;
        } else if (resultadoFinal >= 401 && resultadoFinal <= 500) {
          valorPagar = 40.0;
        } else if (resultadoFinal >= 501 && resultadoFinal <= 800) {
          valorPagar = 70;
        } else if (resultadoFinal >= 801 && resultadoFinal <= 1200) {
          valorPagar = 100;
        } else if (resultadoFinal >= 801 && resultadoFinal <= 2000) {
          valorPagar = 150;
        }
      });
    } else {
      _showAlertDialogNoData(context);
    }
    return resultadoFinal;
  }

  _sendDataHabits(BuildContext context) async {
    await Firebase.initializeApp();
    if (_cantidadGalones.text.isNotEmpty &&
        _cantidadKilometros.text.isNotEmpty) {
      FirebaseFirestore.instance
          .collection("Encuesta")
          .doc("docencuestas")
          .collection("Hábitos y Percepción")
          .add({
        'email': widget.email,
        'Tipo transporte': _finalTransporte,
        'Marca Tranporte': _motoControllerMarca.text,
        'Modelo Transporte': _motoControllerModelo.text,
        'Año Transporte': _motoControllerAnio.text,
        'Kilometros recorridos': _final2,
        'Cantidad kilometros': _cantidadKilometros.text,
        'Numero pasajeros': _cantidadPasajeros.text,
        'Cantidad combustible': _cantidadGalones.text,
        'Transporte Contamina': _finalExternalidad,
        'Nivel contaminacion vehicular': _finalExt6,
        'Conoce externalidades': _finalExt7,
        'Considera externalidades': _finalExt8,
        'Estado': _finalExt9,
      });
    } else {
      _showAlertDialogNoData(context);
    }
  }

  _sendDataValoracion(BuildContext context) async {
    await Firebase.initializeApp();
    if (_compensacionText10.text.isNotEmpty ||
        _compensacionText11.text.isNotEmpty ||
        _compensacionText12.text.isNotEmpty ||
        _compensacionText13.text.isNotEmpty) {
      FirebaseFirestore.instance
          .collection("Encuesta")
          .doc("docencuestas")
          .collection("Valoracion Economica")
          .add({
        'email': widget.email,
        'Dispuesto compensar': _finalCom10,
        'por que no': _compensacionText10.text,
        'USD': _compensacionText11.text,
        'dispuesto compensar transporte': _finalCom12,
        'por que no transporte': _compensacionText12.text,
        'que otra accion': _compensacionText13.text
      });
    } else {
      _showAlertDialogNoDataValo(context);
    }
  }

  _sendDataInfo(BuildContext context) async {
    await Firebase.initializeApp();
    if (_edadText.text.isNotEmpty) {
      FirebaseFirestore.instance
          .collection("Encuesta")
          .doc("docencuestas")
          .collection("Informacion Sociodemografica")
          .add({
        'email': widget.email,
        'edad': _edadText.text,
        'genero': _finalGenero,
        'estado civil': _finalCivil,
        'nivel educacion': _finalEducacion,
        'actividad economica': _finalEconomica,
        'rango ingresos': _finalIngresos
      });
    } else {
      _showAlertDialogNoDataInfo(context);
    }
  }

  _sendCompensacion(BuildContext context) async {
    FirebaseFirestore.instance
        .collection("Encuesta")
        .doc("docencuestas")
        .collection("Compensar")
        .add({
      'email': widget.email,
      'valor huella': resultadoFinal,
      'cantidad compensar': valorPagar,
      'compensacion_si': _siCom,
      'compensacion_no': _noCom,
    });
  }
}
