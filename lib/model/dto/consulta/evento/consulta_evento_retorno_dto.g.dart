// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_evento_retorno_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultaEventoRetornoDto _$ConsultaEventoRetornoDtoFromJson(
        Map<String, dynamic> json) =>
    ConsultaEventoRetornoDto(
      titulo: json['titulo'] as String,
      dataInicio: json['dataInicio'] as int,
      dataFim: json['dataFim'] as int?,
    );

Map<String, dynamic> _$ConsultaEventoRetornoDtoToJson(
        ConsultaEventoRetornoDto instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
    };
