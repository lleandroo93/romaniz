import 'package:romaniz/model/bairro.dart';
import 'package:romaniz/model/cidade.dart';
import 'package:romaniz/model/dto/cadastro/pessoa/cadastro_pessoa_dto.dart';
import 'package:romaniz/resources/bairro_resources.dart';
import 'package:romaniz/resources/cidade_resources.dart';
import 'package:romaniz/resources/pessoa_repository.dart';
import 'package:romaniz/views/home/contatos/cadastro/simples/cadastrar_contato_simples_store.dart';

class CadastrarContatoSimplesViewModel {
  final _store = CadastrarContatoSimplesStore();

  List<Cidade> get cidades => _store.cidades;
  List<Bairro> get bairros => _store.bairros;
  Cidade? get cidadeSelecionada => _store.cidadeSelecionada;
  Bairro? bairroSelecionado;

  set cidadeSelecionada(Cidade? cidade) {
    _store.updateCidadeSelecionada(cidade);
    if (cidade != null) {
      BairroResources().listarPorCidade(cidade).then((bairros) => _store.setBairros(bairros));
    }
  }

  CadastrarContatoSimplesViewModel() {
    _buscarCidades();
  }

  void _buscarCidades() async {
    final cidades = await CidadeResources().listarTodasDeRoraima();
    _store.setCidades(cidades);
  }

  Future cadastrar(CadastroPessoaDto pessoa) {
    return PessoaRepository().criar(pessoa);
  }
}
