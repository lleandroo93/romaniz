import 'package:romaniz/model/cidade.dart';

class Endpoints {
  // static const BASE_URL = 'http://localhost:8080';
  static const BASE_URL = 'https://ancient-refuge-23751.herokuapp.com';
  static const uf_id = '3e1ad101-2c35-487c-8917-3ce01b6cd431'; // Roraima

  static Uri get listarCidades => Uri.parse('$BASE_URL/uf/$uf_id/cidade');
  static Uri get listarEventos => Uri.parse('$BASE_URL/evento');
  static Uri get criarEventos => Uri.parse('$BASE_URL/evento');
  static Uri listarBairrosPorCidade(Cidade cidade) => Uri.parse('$BASE_URL/cidade/${cidade.id}/bairro');
}
