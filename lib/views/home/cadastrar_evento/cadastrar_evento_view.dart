import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:romaniz/views/home/cadastrar_evento/bairro_dropdown_widget%20.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_viewmodel.dart';
import 'package:romaniz/views/home/cadastrar_evento/municipio_dropdown_widget.dart';

class CadastrarEventoView extends StatefulWidget {
  static const String route = 'cadastrar-evento';

  CadastrarEventoView({super.key});

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Form(
          child: Column(
            children: [
              const Text('CADASTRAR EVENTO', style: TextStyle(fontSize: 36, color: Colors.blue)),
              _FormWidget(iconData: Icons.abc, label: 'Nome do evento', controller: _nomeEventoController),
              _FormWidget(iconData: Icons.person, label: 'Contato', controller: _contatoController),
              _FormWidget(
                  iconData: Icons.date_range, label: 'Data do agendamento', controller: _dataAgendamentoController),
              _FormWidget(iconData: Icons.notes, label: 'Resumo', controller: _resumoController),
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
              const _FormWidget(iconData: Icons.pin_drop, label: 'Endereço'),
              const _FormWidget(iconData: Icons.comment, label: 'Observações'),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: ElevatedButton(onPressed: _cadastrar, child: const Text('Cadastrar evento')),
              ),
            ],
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

class _FormWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  final TextEditingController? controller;
  const _FormWidget({
    super.key,
    required this.iconData,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: Text(label),
              icon: Icon(iconData),
            ),
          ),
        ),
      ],
    );
  }
}
