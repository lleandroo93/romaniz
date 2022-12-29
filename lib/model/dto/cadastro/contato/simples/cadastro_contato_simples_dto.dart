import 'package:json_annotation/json_annotation.dart';

part 'cadastro_contato_simples_dto.g.dart';

@JsonSerializable()
class CadastroContatoSimplesDto {
  String nome;
  String? telefone;
  String? resumo;

  CadastroContatoSimplesDto({
    required this.nome,
    this.telefone,
    this.resumo,
  });

  Map<String, dynamic> toJson() => _$CadastroContatoSimplesDtoToJson(this);
}
