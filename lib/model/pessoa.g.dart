// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pessoa _$PessoaFromJson(Map<String, dynamic> json) => Pessoa(
      nome: json['nome'] as String,
      grupo: json['grupo'] as String?,
      contato: json['contato'] as String?,
      resumo: json['resumo'] as String?,
      cidade: json['cidade'] == null
          ? null
          : Cidade.fromJson(json['cidade'] as Map<String, dynamic>),
      bairro: json['bairro'] == null
          ? null
          : Bairro.fromJson(json['bairro'] as Map<String, dynamic>),
      endereco: json['endereco'] as String?,
      googleMaps: json['googleMaps'] as String?,
    );

Map<String, dynamic> _$PessoaToJson(Pessoa instance) => <String, dynamic>{
      'nome': instance.nome,
      'grupo': instance.grupo,
      'contato': instance.contato,
      'resumo': instance.resumo,
      'cidade': instance.cidade,
      'bairro': instance.bairro,
      'endereco': instance.endereco,
      'googleMaps': instance.googleMaps,
    };
