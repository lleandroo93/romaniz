import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/views/home/cadastrar_evento/widgets/data_widget.dart';
import 'package:romaniz/views/home/cadastrar_evento/widgets/hora_widget.dart';
import 'package:romaniz/widgets/bairro_dropdown_widget%20.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_viewmodel.dart';
import 'package:romaniz/widgets/contato_form_widget.dart';
import 'package:romaniz/widgets/municipio_dropdown_widget.dart';
import 'package:romaniz/widgets/my_text_form_widget.dart';

class CadastrarEventoView extends StatefulWidget {
  static const String route = 'cadastrar-evento';
  DateTime? date;
  TimeOfDay? inicio;
  TimeOfDay? fim;

  CadastrarEventoView({
    super.key,
    this.date,
    this.inicio,
    this.fim,
  });

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
    _nomeEventoController = TextEditingController();
    _contatoController = TextEditingController();
    _dataAgendamentoController = TextEditingController();
    _resumoController = TextEditingController();
    _enderecoController = TextEditingController();
    _observacoesController = TextEditingController();
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text('Novo evento', style: KTextStyles.titulo),
                    ),
                    const Icon(Icons.close)
                  ],
                ),
                MyTextFormWidget(iconData: Icons.abc, label: 'Título', controller: _nomeEventoController),
                ContatoFormWidget(
                  onPessoaSelected: (pessoa) => viewModel.contato = pessoa,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataWidget(dataAgendamentoController: _dataAgendamentoController, data: widget.date),
                    const SizedBox(width: 8),
                    HoraWidget(label: 'Início', hora: widget.inicio),
                    const SizedBox(width: 8),
                    HoraWidget(label: 'Fim', hora: widget.fim),
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
                      onPressed: _cadastrar,
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

  void _cadastrar() {
    final event = CalendarEventData(
      title: _nomeEventoController!.text,
      date: DateTime.now(),
      description: _resumoController!.text,
    );
    // CalendarControllerProvider.of(context).controller.add(event);

    viewModel.cadastrar(
      event,
      endereco: _enderecoController?.text,
      observacoes: _observacoesController?.text,
    );
  }
}
