import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romaniz/model/cidade.dart';

const bool isProduction = bool.fromEnvironment('dart.vm.product');
final navigatorKey = GlobalKey<NavigatorState>();

class Endpoints {
  // static const BASE_URL = ;
  static const _prodUrl = 'https://ancient-refuge-23751.herokuapp.com';
  static const _devUrl = 'http://localhost:8080';

  static const _baseUrl = isProduction ? _prodUrl : _devUrl;
  static const ufId = '0ff948e2-2f7a-4290-99b5-bf4a45052ed9'; // Roraima

  static Uri get pessoa => Uri.parse('$_baseUrl/pessoa');
  static Uri get cadastroContatoSimples => Uri.parse('$_baseUrl/pessoa/simples');
  static Uri get cadastroContatoCompleto => Uri.parse('$_baseUrl/pessoa/completo');
  static Uri get listarCidades => Uri.parse('$_baseUrl/uf/$ufId/cidade');
  static Uri get listarEventos => Uri.parse('$_baseUrl/evento');
  static Uri get criarEventos => Uri.parse('$_baseUrl/evento');
  static Uri alterarEvento(String id) => Uri.parse('$_baseUrl/evento/$id');
  static Uri listarBairrosPorCidade(Cidade cidade) => Uri.parse('$_baseUrl/cidade/${cidade.id}/bairro');

  static Uri pessoaSearch({required String criteria, int? limit}) =>
      Uri.parse('$_baseUrl/pessoa/search?criteria=$criteria&limit=$limit');

  static Uri grupoSearch({required String criteria, int? limit}) =>
      Uri.parse('$_baseUrl/grupo/search?criteria=$criteria&limit=$limit');
}

abstract class KColors {
  static const Color black = Color(0xff333333);
  static const Color blueTransparent = Color(0x127bb0d7);
}

abstract class KTextStyles {
  static TextStyle titulo = GoogleFonts.roboto(fontSize: 40, fontWeight: FontWeight.w500);
}
