import 'package:json_annotation/json_annotation.dart';

part 'consulta_grupo_retorno_dto.g.dart';

@JsonSerializable()
class ConsultaGrupoRetornoDto {
  String id;
  String nome;

  ConsultaGrupoRetornoDto({
    required this.id,
    required this.nome,
  });

  factory ConsultaGrupoRetornoDto.fromJson(Map<String, dynamic> json) => _$ConsultaGrupoRetornoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaGrupoRetornoDtoToJson(this);
}
