import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/dto/cadastro/contato/completo/cadastro_contato_completo_dto.dart';
import 'package:romaniz/model/dto/cadastro/contato/simples/cadastro_contato_simples_dto.dart';
import 'package:romaniz/model/dto/consulta/pessoa/consulta_pessoa_retorno_dto.dart';
import 'package:romaniz/model/pessoa.dart';

class ContatoRepository {
  Future<Pessoa?> criarSimples(CadastroContatoSimplesDto dto) async {
    debugPrint(jsonEncode(dto));
    final response = await http.post(
      Endpoints.cadastroContatoSimples,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dto),
    );
    if (response.statusCode == 202) {
      return Pessoa.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<Pessoa?> criarCompleto(CadastroContatoCompletoDto dto) async {
    debugPrint(jsonEncode(dto));
    final response = await http.post(
      Endpoints.cadastroContatoCompleto,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dto),
    );
    if (response.statusCode == 202) {
      return Pessoa.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Pessoa>> listar() async {
    final response = await http.get(Endpoints.pessoa);
    return (jsonDecode(utf8.decode(response.bodyBytes)) as List).map((p) => Pessoa.fromJson(p)).toList();
  }

  Future<List<ConsultaPessoaRetornoDto>> pesquisarPorNome(String nome, {int? limit}) async {
    final response = await http.get(Endpoints.pessoaSearch(criteria: nome, limit: limit));
    return (jsonDecode(utf8.decode(response.bodyBytes)) as List)
        .map((p) => ConsultaPessoaRetornoDto.fromJson(p))
        .toList();
  }
}
