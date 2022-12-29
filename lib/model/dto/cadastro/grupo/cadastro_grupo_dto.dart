import 'package:json_annotation/json_annotation.dart';

part 'cadastro_grupo_dto.g.dart';

@JsonSerializable()
class CadastroGrupoDto {
  String? id;
  String nome;

  CadastroGrupoDto({
    this.id,
    required this.nome,
  });

  factory CadastroGrupoDto.fromJson(Map<String, dynamic> json) => _$CadastroGrupoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroGrupoDtoToJson(this);
}
