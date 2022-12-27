import 'package:json_annotation/json_annotation.dart';

part 'consulta_evento_retorno_dto.g.dart';

@JsonSerializable()
class ConsultaEventoRetornoDto {
  String titulo;
  int data;

  ConsultaEventoRetornoDto({required this.titulo, required this.data});

  factory ConsultaEventoRetornoDto.fromJson(Map<String, dynamic> json) => _$ConsultaEventoRetornoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaEventoRetornoDtoToJson(this);
}
