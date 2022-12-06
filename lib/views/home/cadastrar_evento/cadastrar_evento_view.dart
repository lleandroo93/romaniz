import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/widgets/bairro_dropdown_widget%20.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_viewmodel.dart';
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
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(children: [
                            TextFormField(
                              autofocus: true,
                              decoration: const InputDecoration(
                                  label: Text('Pesquisar'),
                                  icon: Icon(
                                    Icons.search,
                                  )),
                            ),
                            const Text('some text'),
                          ]),
                        );
                      },
                    );
                  },
                  child: IgnorePointer(
                    child: MyTextFormWidget(iconData: Icons.person, label: 'Contato', controller: _contatoController),
                  ),
                ),
                DataHoraWidget(dataAgendamentoController: _dataAgendamentoController),
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
                const MyTextFormWidget(iconData: Icons.comment, label: 'Observações'),
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

class DataHoraWidget extends StatelessWidget {
  DateTime? date;
  TimeOfDay? inicio;
  TimeOfDay? fim;

  DataHoraWidget({
    Key? key,
    required TextEditingController? dataAgendamentoController,
    this.date,
    this.inicio,
    this.fim,
  })  : _dataAgendamentoController = dataAgendamentoController,
        super(key: key);

  final TextEditingController? _dataAgendamentoController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataWidget(dataAgendamentoController: _dataAgendamentoController, data: date),
        const SizedBox(width: 8),
        HoraWidget(label: 'Início', hora: inicio),
        const SizedBox(width: 8),
        HoraWidget(label: 'Fim', hora: fim),
      ],
    );
  }
}

class HoraWidget extends StatelessWidget {
  final String label;
  TimeOfDay? hora;

  HoraWidget({
    Key? key,
    required this.label,
    this.hora,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFF565656)),
          ),
          const SizedBox(height: 4),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 28),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD0D0D0)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: '${hora?.hour ?? '08'}:${hora?.minute ?? '00'}',
                items: _horas
                    .map(
                      (e) => DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: e,
                        child: Text(
                          e,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) => {},
                underline: SizedBox(),
                isExpanded: true,
                focusColor: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  DateTime? data;

  DataWidget({
    Key? key,
    required TextEditingController? dataAgendamentoController,
    this.data,
  })  : _dataAgendamentoController = dataAgendamentoController,
        super(key: key);

  final TextEditingController? _dataAgendamentoController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2032),
          );
          if (selectedDate != null) {
            _dataAgendamentoController!.text = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
          }
        },
        child: IgnorePointer(
          child: MyTextFormWidget(
              iconData: Icons.date_range, label: 'Data do agendamento', controller: _dataAgendamentoController),
        ),
      ),
    );
  }
}

const _horas = [
  '00:00',
  '00:30',
  '01:00',
  '01:30',
  '02:00',
  '02:30',
  '03:00',
  '03:30',
  '04:00',
  '04:30',
  '05:00',
  '05:30',
  '06:00',
  '06:30',
  '07:00',
  '07:30',
  '08:00',
  '08:30',
  '09:00',
  '09:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '15:30',
  '16:00',
  '16:30',
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
  '19:30',
  '20:00',
  '20:30',
  '21:00',
  '21:30',
  '22:00',
  '22:30',
  '23:00',
  '23:30',
];
