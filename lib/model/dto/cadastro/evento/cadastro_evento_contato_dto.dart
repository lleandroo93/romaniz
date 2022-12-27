import 'package:json_annotation/json_annotation.dart';

part 'cadastro_evento_contato_dto.g.dart';

@JsonSerializable()
class CadastroEventoContatoDto {
  String? id;
  String nome;

  CadastroEventoContatoDto({
    this.id,
    required this.nome,
  });

  factory CadastroEventoContatoDto.fromJson(Map<String, dynamic> json) => _$CadastroEventoContatoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroEventoContatoDtoToJson(this);
}
