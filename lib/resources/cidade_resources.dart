import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/cidade.dart';

class CidadeResources {
  Future<List<Cidade>> listarTodasDeRoraima() async {
    final response = await http.get(Endpoints.listarCidades);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((e) => Cidade.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
