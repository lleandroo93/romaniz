// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_contato_completo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroContatoCompletoDto _$CadastroContatoCompletoDtoFromJson(
        Map<String, dynamic> json) =>
    CadastroContatoCompletoDto(
      nome: json['nome'] as String,
      endereco: json['endereco'] as String?,
      telefone: json['telefone'] as String?,
      grupo: json['grupo'] == null
          ? null
          : CadastroGrupoDto.fromJson(json['grupo'] as Map<String, dynamic>),
      resumo: json['resumo'] as String?,
      uf: json['uf'] as String?,
      cidade: json['cidade'] as String?,
      bairro: json['bairro'] as String?,
      googleMaps: json['googleMaps'] as String?,
    );

Map<String, dynamic> _$CadastroContatoCompletoDtoToJson(
        CadastroContatoCompletoDto instance) =>
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
