import 'dart:convert';


class Users {

  String? nombres;
  String? apellidos;
  String? cedula;
  String? telefono;
  String? email;
  String? password;
  String? nickName;
  String? cargo;
  int? monedas;
  int? actividades;


  Users({
    required this.nombres,
    required this.apellidos ,
    required this.cedula ,
    required this.telefono ,
    required this.email ,
    required this.password ,
    required this.nickName ,
    required this.cargo ,
    this.monedas = 0,
    this.actividades = 0
  });

  factory Users.fromJson(
    Map<String, dynamic> json
  ) {
    return Users(
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      cedula: json['cedula'],
      telefono: json['telefono'],
      email: json['email'],
      password: json['password'],
      nickName: json['nickName'],
      cargo: json['cargo'],
      monedas: json['monedas'],
      actividades: json['actividades']
    );
  }

  Map<String, dynamic> toJson () {
    return {
      "nombres": nombres,
      "apellidos": apellidos,
      "cedula": cedula,
      "telefono": telefono,
      "email": email,
      "password": password,
      "nickName": nickName,
      "cargo": cargo,
      "monedas": monedas,
      "actividades": actividades
    };
  }

  @override
  String toString() {
    return 'User { nombres: $nombres, apellidos: $apellidos, cedula: $cedula, telefono: $telefono, email: $email, password: $password, nickName: $nickName, cargo: $cargo, monedas: $monedas, actividades: $actividades';
  }

  List<Users> usersFromJson(String jsonData){
    final data = json.decode(jsonData);
    print(data);
    final userData = List<Users>.from(data.map(<Users>(item) => item));
    return userData;
    //return List<Users>.from(data.map((item) => Users.fromJson(item)));
  }

  String usersToJson (Users usersData) {
    final jsonData = usersData.toJson();
    return json.encode(jsonData); 
  }

}