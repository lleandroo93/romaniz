import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/dto/cadastro/cadastro_pessoa_dto.dart';
import 'package:romaniz/model/pessoa.dart';

class PessoaRepository {
  Future<Pessoa?> criar(CadastroPessoaDto dto) async {
    debugPrint(jsonEncode(dto));
    final response = await http.post(
      Endpoints.pessoa,
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
}
