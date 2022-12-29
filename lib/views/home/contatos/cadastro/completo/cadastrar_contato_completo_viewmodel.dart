import 'package:romaniz/model/bairro.dart';
import 'package:romaniz/model/cidade.dart';
import 'package:romaniz/model/dto/cadastro/contato/completo/cadastro_contato_completo_dto.dart';
import 'package:romaniz/model/dto/cadastro/grupo/cadastro_grupo_dto.dart';
import 'package:romaniz/model/dto/consulta/grupo/consulta_grupo_retorno_dto.dart';
import 'package:romaniz/resources/bairro_resources.dart';
import 'package:romaniz/resources/cidade_resources.dart';
import 'package:romaniz/resources/pessoa_repository.dart';
import 'package:romaniz/views/home/contatos/cadastro/simples/cadastrar_contato_simples_store.dart';

class CadastrarContatoCompletoViewModel {
  final _store = CadastrarContatoSimplesStore();

  ConsultaGrupoRetornoDto? grupo;

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

  CadastrarContatoCompletoViewModel() {
    _buscarCidades();
  }

  void _buscarCidades() async {
    final cidades = await CidadeResources().listarTodasDeRoraima();
    _store.setCidades(cidades);
  }

  Future cadastrar(CadastroContatoCompletoDto pessoa) {
    final g = grupo;
    if (g != null) {
      pessoa.grupo = CadastroGrupoDto(id: g.id, nome: g.nome);
    }
    return ContatoRepository().criarCompleto(pessoa);
  }
}
