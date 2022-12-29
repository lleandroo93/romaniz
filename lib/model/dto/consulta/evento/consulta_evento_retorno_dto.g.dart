// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_evento_retorno_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultaEventoRetornoDto _$ConsultaEventoRetornoDtoFromJson(
        Map<String, dynamic> json) =>
    ConsultaEventoRetornoDto(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      contato: json['contato'] as String?,
      dataInicio: json['dataInicio'] as int,
      dataFim: json['dataFim'] as int?,
      resumo: json['resumo'] as String?,
      endereco: json['endereco'] as String?,
      observacao: json['observacao'] as String?,
    );

Map<String, dynamic> _$ConsultaEventoRetornoDtoToJson(
        ConsultaEventoRetornoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'contato': instance.contato,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
      'resumo': instance.resumo,
      'endereco': instance.endereco,
      'observacao': instance.observacao,
    };
