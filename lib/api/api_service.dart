import 'dart:convert';
import 'package:carbono_app/models/empresas.dart';
import 'package:carbono_app/models/task.dart';
import 'package:carbono_app/models/user.dart';
import 'package:http/http.dart';

class UserService {
  final apiUrl = Uri.parse("https://carbonoapp.herokuapp.com/signin");
  final apiUrlSign = Uri.parse("https://carbonoapp.herokuapp.com/signup");
  final apiUrlLogin = Uri.parse("https://carbonoapp.herokuapp.com");
  final apiUriTask = Uri.parse("https://carbonoapp.herokuapp.com/tasks");
  final apiUriEmpresa = Uri.parse("https://carbonoapp.herokuapp.com/empresas");
  var url = ("carbonoapp.herokuapp.com");

  Future <Map<Users, dynamic>> getUsers() async {
    Response res = await get(apiUrl);
    if (res.statusCode == 200) {
      Map<Users, dynamic> data = Map<Users, dynamic>.from(json.decode(res.body));
      return data;
    } else {
      throw "Error al cargar la lista";
    }
  }

  Future <Users> createUser(Users users) async {
    Map data = {
      'nombres': users.nombres,
      'apellidos': users.apellidos,
      'cedula': users.cedula,
      'telefono': users.telefono,
      'email': users.email,
      'password': users.password,
      'nickName': users.nickName,
      'cargo': users.cargo,
    };

    final Response res = await post(
      apiUrlSign,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (res.statusCode == 200) {
      return Users.fromJson(json.decode(res.body));
    } else {
      throw Exception("Falló nuevo usuario");
    }
  }

  Future <List<Users>> getUsersByEmail (String email) async {
    Response res = await get(Uri.https("carbonoapp.herokuapp.com", "/userEmail/$email"));
    if (res.statusCode == 200) {
      final dataUser = (json.decode(res.body)['usuarios'] as List).map((e) 
      => Users.fromJson(e)).toList();
      return dataUser;
    } else {
      throw Exception ("Falló llamada de usuarios");
    }
  }
/*
  Future <Map<String, dynamic>> getUsersLogin (String email, String password) async {
    // ignore: unused_local_variable, unnecessary_cast
    //Response res = await get(apiUrlLogin);
    Response res = await get(Uri.https(url, '/user/$email&$password'));
    //print(res.body);
    if (res.statusCode == 200) {
      //List<dynamic> body = jsonDecode(res.body);
      //List<Users> users = body.map((dynamic item) => Users.fromJson(item)).toList();
      Map<String, dynamic> data = Map<String, dynamic>.from(json.decode(res.body));
      return data;
    } else {
      throw Exception("Falló nuevo usuario");
    }
  }
  */
  
  /*
  Servicios para los Tasks
  */

  Future <List<TaskModel>> getAllTasks () async {
    Response res = await get(apiUriTask);
    final dataTask = json.decode(res.body)['Activities'] as List;
    return dataTask.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future <List<EmpresasModel>> getAllEmpresas () async {
    Response res = await get(apiUriEmpresa);
    final dataEmpresa = json.decode(res.body)['Empresas'] as List;
    return dataEmpresa.map((e) => EmpresasModel.fromJson(e)).toList();
  }
  
}