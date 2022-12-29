import 'package:json_annotation/json_annotation.dart';

part 'consulta_pessoa_retorno_dto.g.dart';

@JsonSerializable()
class ConsultaPessoaRetornoDto {
  String id;
  String nome;
  String? telefone;
  String? grupo;
  String? endereco;

  ConsultaPessoaRetornoDto({
    required this.id,
    required this.nome,
    this.telefone,
    this.grupo,
    this.endereco,
  });

  factory ConsultaPessoaRetornoDto.fromJson(Map<String, dynamic> json) => _$ConsultaPessoaRetornoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaPessoaRetornoDtoToJson(this);
}
