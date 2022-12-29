import 'package:json_annotation/json_annotation.dart';

part 'consulta_evento_retorno_dto.g.dart';

@JsonSerializable()
class ConsultaEventoRetornoDto {
  String id;
  String titulo;
  String? contato;
  int dataInicio;
  int? dataFim;
  String? descricao;
  String? endereco;
  String? observacao;

  ConsultaEventoRetornoDto({
    required this.id,
    required this.titulo,
    this.contato,
    required this.dataInicio,
    this.dataFim,
    this.descricao,
    this.endereco,
    this.observacao,
  });

  String? get dataInicioFormatada {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(dataInicio);
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }

  factory ConsultaEventoRetornoDto.fromJson(Map<String, dynamic> json) => _$ConsultaEventoRetornoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaEventoRetornoDtoToJson(this);
}
