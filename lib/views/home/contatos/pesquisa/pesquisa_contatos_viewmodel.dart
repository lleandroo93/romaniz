import 'package:romaniz/model/dto/consulta/pessoa/consulta_pessoa_retorno_dto.dart';
import 'package:romaniz/resources/pessoa_repository.dart';

class PesquisaContatosViewModel {
  Future<List<ConsultaPessoaRetornoDto>> listar() {
    return ContatoRepository().listar();
  }
}
