import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_view.dart';

class AgendaView extends StatefulWidget {
  static const String route = 'agenda';
  const AgendaView({super.key});

  @override
  State<AgendaView> createState() => _AgendaViewState();
}

class _AgendaViewState extends State<AgendaView> {
  DateTime dateTime = DateTime.now();
  final dateViewKey = GlobalKey<DayViewState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context).pushNamed(CadastrarEventoView.route),
            child: const Icon(
              Icons.add,
              size: 56,
            ),
          ),
          body: Row(
            children: [
              MonthView(
                width: screenSize.width / 2,
                cellAspectRatio: 1,
                onCellTap: (events, date) {
                  setState(() {
                    dateTime = date;
                    dateViewKey.currentState?.jumpToDate(date);
                  });
                },
              ),
              DayView(
                key: dateViewKey,
                width: screenSize.width / 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
