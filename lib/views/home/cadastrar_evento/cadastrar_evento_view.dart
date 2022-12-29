import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/dto/consulta/evento/consulta_evento_retorno_dto.dart';
import 'package:romaniz/views/home/cadastrar_evento/widgets/data_widget.dart';
import 'package:romaniz/views/home/cadastrar_evento/widgets/hora_widget.dart';
import 'package:romaniz/views/home/cadastrar_evento/widgets/horas.dart';
import 'package:romaniz/widgets/bairro_dropdown_widget%20.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_viewmodel.dart';
import 'package:romaniz/widgets/contato_form_widget.dart';
import 'package:romaniz/widgets/municipio_dropdown_widget.dart';
import 'package:romaniz/widgets/my_text_form_widget.dart';

class CadastrarEventoView extends StatefulWidget {
  static const String route = 'cadastrar-evento';

  ConsultaEventoRetornoDto? eventoAlterar;
  DateTime date;
  TimeOfDay? inicio;
  TimeOfDay? fim = horaAtual.replacing(hour: horaAtual.hour == 23 ? 0 : horaAtual.hour + 1);

  CadastrarEventoView({
    super.key,
    DateTime? dataEvento,
    this.eventoAlterar,
  })  : date = dataEvento ?? DateTime.now(),
        inicio = eventoAlterar == null
            ? horaAtual
            : TimeOfDay.fromDateTime(DateTime.fromMillisecondsSinceEpoch(eventoAlterar.dataInicio)),
        fim = eventoAlterar == null || eventoAlterar.dataFim == null
            ? horaAtual.replacing(hour: horaAtual.hour == 23 ? 0 : horaAtual.hour + 1)
            : TimeOfDay.fromDateTime(DateTime.fromMillisecondsSinceEpoch(eventoAlterar.dataFim!));

  @override
  State<CadastrarEventoView> createState() => _CadastrarEventoViewState();
}

class _CadastrarEventoViewState extends State<CadastrarEventoView> {
  final CadastrarEventoViewModel viewModel = CadastrarEventoViewModel();
  TextEditingController? _nomeEventoController;
  TextEditingController? _contatoController;
  TextEditingController? _dataAgendamentoController;
  TextEditingController? _resumoController;
  TextEditingController? _enderecoController;
  TextEditingController? _observacoesController;

  @override
  void initState() {
    super.initState();
    _nomeEventoController = TextEditingController(text: widget.eventoAlterar?.titulo);
    _contatoController = TextEditingController(text: widget.eventoAlterar?.contato);
    _dataAgendamentoController = TextEditingController(text: widget.eventoAlterar?.dataInicioFormatada);
    _resumoController = TextEditingController(text: widget.eventoAlterar?.descricao);
    _enderecoController = TextEditingController(text: widget.eventoAlterar?.endereco);
    _observacoesController = TextEditingController(text: widget.eventoAlterar?.observacao);
  }

  @override
  void dispose() {
    _nomeEventoController?.dispose();
    _contatoController?.dispose();
    _dataAgendamentoController?.dispose();
    _resumoController?.dispose();
    _enderecoController?.dispose();
    _observacoesController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Form(
            child: Column(
              children: [
                Visibility(
                  visible: widget.eventoAlterar == null,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text('Novo evento', style: KTextStyles.titulo),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(false),
                        child: const Icon(Icons.close),
                      )
                    ],
                  ),
                ),
                MyTextFormWidget(iconData: Icons.abc, label: 'Título', controller: _nomeEventoController),
                ContatoFormWidget(
                  onPessoaSelected: (pessoa) => viewModel.contato = pessoa,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataWidget(
                      dataAgendamentoController: _dataAgendamentoController,
                      data: widget.date,
                      onChanged: (value) {
                        setState(() {
                          widget.date = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    HoraWidget(
                      label: 'Início',
                      hora: widget.inicio,
                      onChanged: (value) {
                        setState(() {
                          widget.inicio = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    HoraWidget(
                      label: 'Fim',
                      hora: widget.fim,
                      onChanged: (value) {
                        setState(() {
                          widget.fim = value;
                        });
                      },
                    ),
                  ],
                ),
                MyTextFormWidget(iconData: Icons.notes, label: 'Resumo', controller: _resumoController),
                Observer(builder: (_) {
                  return MunicipioDropDownWidget(
                    cidades: viewModel.cidades,
                    onChanged: (cidade) => viewModel.cidadeSelecionada = cidade,
                  );
                }),
                Observer(builder: (_) {
                  return BairroDropDownWidget(
                    bairros: viewModel.bairros,
                    onChanged: (bairro) => viewModel.bairroSelecionado = bairro,
                  );
                }),
                const MyTextFormWidget(iconData: Icons.pin_drop, label: 'Endereço'),
                MyTextFormWidget(iconData: Icons.comment, label: 'Observações', controller: _observacoesController),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () => _cadastrar(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF63C554),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Salvar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _cadastrar(BuildContext context) {
    final diaEvento = widget.date;
    final inicioEvento = widget.inicio;
    final finalEvento = widget.fim;

    if (inicioEvento == null) {
      _showSnackBar(context, 'Informe o início do evento.');
      return;
    }

    DateTime date = DateTime(
      diaEvento.year,
      diaEvento.month,
      diaEvento.day,
      inicioEvento.hour,
      inicioEvento.minute,
    );

    DateTime? endDate;

    if (finalEvento != null) {
      endDate = DateTime(
        diaEvento.year,
        diaEvento.month,
        diaEvento.day,
        finalEvento.hour,
        finalEvento.minute,
      );
    }

    final event = CalendarEventData<ConsultaEventoRetornoDto>(
      title: _nomeEventoController!.text,
      date: date,
      endDate: endDate,
      description: _resumoController!.text,
      event: widget.eventoAlterar,
    );

    viewModel.cadastrar(
      event,
      endereco: _enderecoController?.text,
      observacoes: _observacoesController?.text,
    );

    _showSnackBar(context, 'Evento criado');
    Navigator.of(context).pop(true);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
      ),
    );
  }
}
