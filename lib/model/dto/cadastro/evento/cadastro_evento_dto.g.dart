// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_evento_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroEventoDto _$CadastroEventoDtoFromJson(Map<String, dynamic> json) =>
    CadastroEventoDto(
      dataInicio: DateTime.parse(json['dataInicio'] as String),
      dataFim: json['dataFim'] == null
          ? null
          : DateTime.parse(json['dataFim'] as String),
      contato: json['contato'] == null
          ? null
          : CadastroEventoContatoDto.fromJson(
              json['contato'] as Map<String, dynamic>),
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String?,
      municipio: json['municipio'] as String?,
      bairro: json['bairro'] as String?,
      endereco: json['endereco'] as String?,
      observacao: json['observacao'] as String?,
    );

Map<String, dynamic> _$CadastroEventoDtoToJson(CadastroEventoDto instance) =>
    <String, dynamic>{
      'dataInicio': instance.dataInicio.toIso8601String(),
      'dataFim': instance.dataFim?.toIso8601String(),
      'contato': instance.contato,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'municipio': instance.municipio,
      'bairro': instance.bairro,
      'endereco': instance.endereco,
      'observacao': instance.observacao,
    };
