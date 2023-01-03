import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:romaniz/model/dto/consulta/evento/consulta_evento_retorno_dto.dart';
import 'package:romaniz/views/home/agenda/agenda_viewmodel.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_view.dart';
import 'package:provider/provider.dart';

class AgendaMobileView extends StatefulWidget {
  AgendaMobileView({super.key});

  @override
  State<AgendaMobileView> createState() => _AgendaMobileViewState();
}

class _AgendaMobileViewState extends State<AgendaMobileView> {
  EventController<ConsultaEventoRetornoDto> eventController = EventController();

  @override
  Widget build(BuildContext context) {
    AgendaViewModel viewModel = context.read<AgendaViewModel>();
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
    return Row(
      children: [
        MonthView(
          key: UniqueKey(),
          controller: CalendarControllerProvider.of<ConsultaEventoRetornoDto>(context).controller,
          weekDayBuilder: (day) {
            if (day == 0) {
              return const Text('Seg', textAlign: TextAlign.center);
            } else if (day == 1) {
              return const Text('Ter', textAlign: TextAlign.center);
            } else if (day == 2) {
              return const Text('Qua', textAlign: TextAlign.center);
            } else if (day == 3) {
              return const Text('Qui', textAlign: TextAlign.center);
            } else if (day == 4) {
              return const Text('Sex', textAlign: TextAlign.center);
            } else if (day == 5) {
              return const Text('Sab', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber));
            } else {
              return const Text('Dom', textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent));
            }
          },
          cellAspectRatio: 1,
          onCellTap: (events, date) {
            setState(() {
              dateTime = date;
              dateViewKey.currentState?.jumpToDate(date);
            });
          },
          onEventTap: (event, date) => _showEvent(context, event),
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
