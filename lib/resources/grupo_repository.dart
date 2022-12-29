import 'dart:convert';

import 'package:romaniz/constants.dart';
import 'package:http/http.dart' as http;
import 'package:romaniz/model/dto/consulta/grupo/consulta_grupo_retorno_dto.dart';

class GrupoRepository {
  Future<List<ConsultaGrupoRetornoDto>> pesquisarPorNome(String nome, {int? limit}) async {
    final response = await http.get(Endpoints.grupoSearch(criteria: nome, limit: limit));
    return (jsonDecode(utf8.decode(response.bodyBytes)) as List)
        .map((p) => ConsultaGrupoRetornoDto.fromJson(p))
        .toList();
  }
}
