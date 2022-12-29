import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:romaniz/model/dto/consulta/evento/consulta_evento_retorno_dto.dart';
import 'package:romaniz/views/home/agenda/agenda_viewmodel.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_view.dart';

class AgendaView extends StatefulWidget {
  static const String route = 'agenda';
  const AgendaView({super.key});

  @override
  State<AgendaView> createState() => _AgendaViewState();
}

class _AgendaViewState extends State<AgendaView> {
  EventController<ConsultaEventoRetornoDto> eventController = EventController();
  AgendaViewModel viewModel = AgendaViewModel();

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<ConsultaEventoRetornoDto>(
      controller: eventController,
      child: MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: _showCadastroDialog,
            child: const Icon(
              Icons.add,
              size: 56,
            ),
          ),
          body: FutureBuilder(
              future: viewModel.listar(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final listOfEvents = snapshot.data as List<CalendarEventData<ConsultaEventoRetornoDto>>;
                    eventController.addAll(listOfEvents);
                  }
                  return const CalendarRow();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  void _showCadastroDialog() async {
    final sucesso = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: CadastrarEventoView(),
        contentPadding: EdgeInsets.zero,
      ),
    );

    if (sucesso ?? false) {
      setState(() {});
    }
  }
}

class CalendarRow extends StatefulWidget {
  const CalendarRow({super.key});

  @override
  State<CalendarRow> createState() => _CalendarRowState();
}

class _CalendarRowState extends State<CalendarRow> {
  DateTime dateTime = DateTime.now();
  final dateViewKey = GlobalKey<DayViewState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        MonthView(
          key: UniqueKey(),
          controller: CalendarControllerProvider.of<ConsultaEventoRetornoDto>(context).controller,
          width: screenSize.width / 2,
          cellAspectRatio: 1,
          onCellTap: (events, date) {
            setState(() {
              dateTime = date;
              dateViewKey.currentState?.jumpToDate(date);
            });
          },
          onEventTap: (event, date) => _showEvent(context, event),
        ),
        Flexible(
          flex: 1,
          child: DayView<ConsultaEventoRetornoDto>(
            key: dateViewKey,
            width: screenSize.width / 3,
            onEventTap: (events, date) async {
              final sucesso = await _showEvent(context, events.first);

              if (sucesso ?? false) {
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }

  Future<bool?> _showEvent(BuildContext context, CalendarEventData<ConsultaEventoRetornoDto> event) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(event.title),
        content: CadastrarEventoView(
          dataEvento: event.date,
          eventoAlterar: event.event,
        ),
      ),
    );
  }
}
