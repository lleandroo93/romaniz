import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/dto/cadastro/evento/cadastro_evento_dto.dart';
import 'package:romaniz/model/dto/consulta/evento/consulta_evento_retorno_dto.dart';
import 'package:romaniz/model/evento.dart';

class EventoResources {
  Future<List<ConsultaEventoRetornoDto>> listar() async {
    final response = await http.get(Endpoints.listarEventos);
    if (response.statusCode == 200) {
      return (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((e) => ConsultaEventoRetornoDto.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<Evento?> salvar(CadastroEventoDto evento) async {
    if (evento.id == null) {
      return _criar(evento);
    } else {
      return _alterar(evento.id!, evento);
    }
  }

  Future<Evento?> _criar(CadastroEventoDto evento) async {
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

  Future<Evento?> _alterar(String id, CadastroEventoDto evento) async {
    debugPrint(jsonEncode(evento));
    final response = await http.put(
      Endpoints.alterarEvento(id),
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
