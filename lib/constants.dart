import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romaniz/model/cidade.dart';

class Endpoints {
  static const BASE_URL = 'http://localhost:8080';
  // static const BASE_URL = 'https://ancient-refuge-23751.herokuapp.com';
  static const uf_id = '0ff948e2-2f7a-4290-99b5-bf4a45052ed9'; // Roraima

  static Uri get pessoa => Uri.parse('$BASE_URL/pessoa');
  static Uri get listarCidades => Uri.parse('$BASE_URL/uf/$uf_id/cidade');
  static Uri get listarEventos => Uri.parse('$BASE_URL/evento');
  static Uri get criarEventos => Uri.parse('$BASE_URL/evento');
  static Uri listarBairrosPorCidade(Cidade cidade) => Uri.parse('$BASE_URL/cidade/${cidade.id}/bairro');

  static Uri pessoaSearch({required String criteria, int? limit}) =>
      Uri.parse('$BASE_URL/pessoa/search?criteria=$criteria&limit=$limit');
}

abstract class KColors {
  static const Color black = Color(0xff333333);
  static const Color blue_transparent = Color(0x127bb0d7);
}

abstract class KTextStyles {
  static TextStyle titulo = GoogleFonts.roboto(fontSize: 40, fontWeight: FontWeight.w500);
}
