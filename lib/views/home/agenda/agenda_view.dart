import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class AgendaView extends StatefulWidget {
  static const String route = 'agenda';
  const AgendaView({super.key});

  @override
  State<AgendaView> createState() => _AgendaViewState();
}

class _AgendaViewState extends State<AgendaView> {
  String message = 'Selecione uma data';
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              Expanded(child: MonthView(
                onCellTap: (events, date) {
                  setState(() {
                    message = 'Estes são os eventos do dia ${date.day}/${date.month}/${date.year}';
                  });
                },
              )),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
