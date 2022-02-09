class EmpresasModel {
  String? nombreEmpresa;
  String? objetivoEmpresa;
  String? mision;
  String? vision;
  String? anio;
  String? lugarRadica;

  EmpresasModel({
    required this.nombreEmpresa, required this.objetivoEmpresa,
    required this.mision, required this.vision, required this.anio, required this.lugarRadica
  });

  EmpresasModel.fromJson (Map json)
  : nombreEmpresa = json['nombreEmpresa'],
    objetivoEmpresa = json['objetivoEmpresa'],
    mision = json['mision'],
    vision = json['vision'],
    anio = json['anio'],
    lugarRadica = json['lugarRadica'];

    Map toJson () {
      return {
        'nombreEmpresa': nombreEmpresa,
        'objetivoEmpresa':objetivoEmpresa,
        'mision': mision,
        'vision': vision,
        'anio': anio,
        'lugarRadica': lugarRadica
      };
    }
}