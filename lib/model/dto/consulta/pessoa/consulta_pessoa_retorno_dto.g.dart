// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_pessoa_retorno_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultaPessoaRetornoDto _$ConsultaPessoaRetornoDtoFromJson(
        Map<String, dynamic> json) =>
    ConsultaPessoaRetornoDto(
      id: json['id'] as String,
      nome: json['nome'] as String,
      telefone: json['telefone'] as String?,
      grupo: json['grupo'] as String?,
    );

Map<String, dynamic> _$ConsultaPessoaRetornoDtoToJson(
        ConsultaPessoaRetornoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'telefone': instance.telefone,
      'grupo': instance.grupo,
    };
