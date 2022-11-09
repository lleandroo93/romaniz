// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evento _$EventoFromJson(Map<String, dynamic> json) => Evento(
      data: DateTime.parse(json['data'] as String),
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String?,
      municipio: json['municipio'] as String?,
      bairro: json['bairro'] as String?,
      endereco: json['endereco'] as String?,
      observacao: json['observacao'] as String?,
    );

Map<String, dynamic> _$EventoToJson(Evento instance) => <String, dynamic>{
      'data': instance.data.toIso8601String(),
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'municipio': instance.municipio,
      'bairro': instance.bairro,
      'endereco': instance.endereco,
      'observacao': instance.observacao,
    };
