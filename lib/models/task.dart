class TaskModel {
  String? titleTask;
  String? objetivo;
  String? body;
  int? recompensa;
  Recomendaciones? recomendaciones;
  int? tipoActividad;

  TaskModel({
    required this.titleTask, required this.objetivo,
    required this.body, required this.recompensa,
    required this.recomendaciones, required this.tipoActividad
  });

  TaskModel.fromJson(Map json)
  : titleTask = json['titleTask'],
    objetivo = json['objetivo'],
    body = json['body'],
    recompensa = json['recompensa'],
    tipoActividad = json['tipoActividad'],
    recomendaciones = Recomendaciones.fromJson(json['recomendaciones'],
    );

    Map toJson() {
      return {
        'titleTask': titleTask,
        'objetivo': objetivo,
        'body': body,
        'recompensa': recompensa,
        'recomendaciones': recomendaciones!.toJson(),
        'tipoActividad': tipoActividad
      };
    }
}




class Recomendaciones {
    String? title;
    String? bodyRec;

    Recomendaciones({
      required this.title, required this.bodyRec
    });

  Recomendaciones.fromJson(Map json)
  : title = json['title'],
    bodyRec = json['bodyRec'];

    Map toJson()  {
      return {
        'title': title,
        'bodyRec': bodyRec
      };
    }
}