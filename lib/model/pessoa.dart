import 'package:romaniz/model/bairro.dart';
import 'package:romaniz/model/cidade.dart';

class Pessoa {
  String nome;
  String? grupo;
  String? contato;
  String? resumo;
  Cidade? cidade;
  Bairro? bairro;
  String? endereco;
  String? googleMaps;

  Pessoa({
    required this.nome,
    this.grupo,
    this.contato,
    this.resumo,
    this.cidade,
    this.bairro,
    this.endereco,
    this.googleMaps,
  });
}
