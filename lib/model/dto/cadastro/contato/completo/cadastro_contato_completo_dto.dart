import 'package:json_annotation/json_annotation.dart';

part 'cadastro_contato_completo_dto.g.dart';

@JsonSerializable()
class CadastroContatoCompletoDto {
  String nome;
  String? endereco;
  String? telefone;
  String? grupo;
  String? resumo;
  String? uf;
  String? cidade;
  String? bairro;
  String? googleMaps;

  CadastroContatoCompletoDto({
    required this.nome,
    this.endereco,
    this.telefone,
    this.grupo,
    this.resumo,
    this.uf,
    this.cidade,
    this.bairro,
    this.googleMaps,
  });

  Map<String, dynamic> toJson() => _$CadastroContatoCompletoDtoToJson(this);
}
