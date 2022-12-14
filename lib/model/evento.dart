import 'package:json_annotation/json_annotation.dart';
import 'package:romaniz/model/pessoa.dart';

part 'evento.g.dart';

@JsonSerializable()
class Evento {
  DateTime data;
  Pessoa? contato;
  String titulo;
  String? descricao;
  String? municipio;
  String? bairro;
  String? endereco;
  String? observacao;

  Evento({
    required this.data,
    this.contato,
    required this.titulo,
    required this.descricao,
    required this.municipio,
    required this.bairro,
    required this.endereco,
    required this.observacao,
  });

  factory Evento.fromJson(Map<String, dynamic> json) => _$EventoFromJson(json);

  Map<String, dynamic> toJson() => _$EventoToJson(this);
}
