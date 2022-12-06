import 'package:romaniz/model/pessoa.dart';
import 'package:romaniz/resources/pessoa_repository.dart';

class PesquisaContatosViewModel {
  Future<List<Pessoa>> listar() {
    return PessoaRepository().listar();
  }
}
