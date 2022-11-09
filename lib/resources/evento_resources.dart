import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/evento.dart';

class EventoResources {
  Future<List<Evento>> listar() async {
    final response = await http.get(Endpoints.listarEventos);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((e) => Evento.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Evento?> criar(Evento evento) async {
    debugPrint(jsonEncode(evento));
    final response = await http.post(
      Endpoints.criarEventos,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(evento),
    );
    if (response.statusCode == 202) {
      return Evento.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
