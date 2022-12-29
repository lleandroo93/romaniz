import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/widgets.dart';
import 'package:romaniz/model/bairro.dart';
import 'package:romaniz/model/cidade.dart';
import 'package:romaniz/model/dto/cadastro/evento/cadastro_evento_contato_dto.dart';
import 'package:romaniz/model/dto/cadastro/evento/cadastro_evento_dto.dart';
import 'package:romaniz/model/dto/consulta/evento/consulta_evento_retorno_dto.dart';
import 'package:romaniz/model/dto/consulta/pessoa/consulta_pessoa_retorno_dto.dart';
import 'package:romaniz/resources/bairro_resources.dart';
import 'package:romaniz/resources/cidade_resources.dart';
import 'package:romaniz/resources/evento_resources.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_store.dart';

class CadastrarEventoViewModel {
  final _store = CadastrarEventoStore();

  ConsultaPessoaRetornoDto? contato;
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
    debugPrint('CadastrarEventoViewModel constructor called');
    _buscarCidades();
  }

  void _buscarCidades() async {
    final cidades = await CidadeResources().listarTodasDeRoraima();
    _store.setCidades(cidades);
  }

  void cadastrar(CalendarEventData<ConsultaEventoRetornoDto> eventData, {String? endereco, String? observacoes}) {
    final contato = this.contato;
    CadastroEventoContatoDto? cadastroEventoContatoDto;
    if (contato != null) {
      cadastroEventoContatoDto = CadastroEventoContatoDto(id: contato.id, nome: contato.nome);
    }

    final evento = CadastroEventoDto(
      id: eventData.event?.id,
      contato: cadastroEventoContatoDto,
      dataInicio: eventData.date.toUtc(),
      dataFim: eventData.endDate.toUtc(),
      titulo: eventData.title,
      descricao: eventData.description,
      municipio: cidadeSelecionada?.id,
      bairro: bairroSelecionado?.id,
      endereco: endereco ?? '',
      observacao: observacoes ?? '',
    );
    EventoResources().salvar(evento);
  }
}
