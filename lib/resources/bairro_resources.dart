import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/bairro.dart';
import 'package:romaniz/model/cidade.dart';

class BairroResources {
  Future<List<Bairro>> listarPorCidade(Cidade cidade) async {
    final response = await http.get(Endpoints.listarBairrosPorCidade(cidade));
    if (response.statusCode == 200) {
      return (jsonDecode(utf8.decode(response.bodyBytes)) as List).map((e) => Bairro.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
