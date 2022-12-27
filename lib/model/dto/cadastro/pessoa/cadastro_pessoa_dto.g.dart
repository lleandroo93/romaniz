// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_pessoa_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroPessoaDto _$CadastroPessoaDtoFromJson(Map<String, dynamic> json) =>
    CadastroPessoaDto(
      nome: json['nome'] as String,
      endereco: json['endereco'] as String?,
      telefone: json['telefone'] as String?,
      grupo: json['grupo'] as String?,
      resumo: json['resumo'] as String?,
      uf: json['uf'] as String?,
      cidade: json['cidade'] as String?,
      bairro: json['bairro'] as String?,
      googleMaps: json['googleMaps'] as String?,
    );

Map<String, dynamic> _$CadastroPessoaDtoToJson(CadastroPessoaDto instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
      'grupo': instance.grupo,
      'resumo': instance.resumo,
      'uf': instance.uf,
      'cidade': instance.cidade,
      'bairro': instance.bairro,
      'googleMaps': instance.googleMaps,
    };
