import 'package:json_annotation/json_annotation.dart';

part 'cadastro_pessoa_dto.g.dart';

@JsonSerializable()
class CadastroPessoaDto {
  String nome;
  String? endereco;
  String? telefone;
  String? grupo;
  String? resumo;
  String? uf;
  String? cidade;
  String? bairro;
  String? googleMaps;

  CadastroPessoaDto({
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

  Map<String, dynamic> toJson() => _$CadastroPessoaDtoToJson(this);
}
