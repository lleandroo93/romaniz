import 'package:calendar_view/calendar_view.dart';
import 'package:romaniz/model/bairro.dart';
import 'package:romaniz/model/cidade.dart';
import 'package:romaniz/model/evento.dart';
import 'package:romaniz/resources/bairro_resources.dart';
import 'package:romaniz/resources/cidade_resources.dart';
import 'package:romaniz/resources/evento_resources.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_store.dart';

class CadastrarEventoViewModel {
  final _store = CadastrarEventoStore();

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

  CadastrarEventoViewModel() {
    _buscarCidades();
  }

  void _buscarCidades() async {
    final cidades = await CidadeResources().listarTodasDeRoraima();
    _store.setCidades(cidades);
  }

  void cadastrar(CalendarEventData eventData, {String? endereco, String? observacoes}) {
    final evento = Evento(
      data: eventData.date,
      titulo: eventData.title,
      descricao: eventData.description,
      municipio: cidadeSelecionada?.nome ?? '',
      bairro: bairroSelecionado?.nome ?? '',
      endereco: endereco ?? '',
      observacao: observacoes ?? '',
    );
    EventoResources().criar(evento);
  }
}
