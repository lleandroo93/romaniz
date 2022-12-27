import 'package:json_annotation/json_annotation.dart';
import 'package:romaniz/model/dto/cadastro/evento/cadastro_evento_contato_dto.dart';

part 'cadastro_evento_dto.g.dart';

@JsonSerializable()
class CadastroEventoDto {
  DateTime dataInicio;
  DateTime? dataFim;
  CadastroEventoContatoDto? contato;
  String titulo;
  String? descricao;
  String? municipio;
  String? bairro;
  String? endereco;
  String? observacao;

  CadastroEventoDto({
    required this.dataInicio,
    this.dataFim,
    this.contato,
    required this.titulo,
    required this.descricao,
    required this.municipio,
    required this.bairro,
    required this.endereco,
    required this.observacao,
  });

  factory CadastroEventoDto.fromJson(Map<String, dynamic> json) => _$CadastroEventoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroEventoDtoToJson(this);
}
