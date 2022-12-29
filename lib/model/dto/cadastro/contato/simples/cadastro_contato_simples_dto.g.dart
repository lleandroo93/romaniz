// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_contato_simples_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroContatoSimplesDto _$CadastroContatoSimplesDtoFromJson(
        Map<String, dynamic> json) =>
    CadastroContatoSimplesDto(
      nome: json['nome'] as String,
      telefone: json['telefone'] as String?,
      resumo: json['resumo'] as String?,
    );

Map<String, dynamic> _$CadastroContatoSimplesDtoToJson(
        CadastroContatoSimplesDto instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'telefone': instance.telefone,
      'resumo': instance.resumo,
    };
