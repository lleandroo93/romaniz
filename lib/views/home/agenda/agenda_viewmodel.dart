import 'package:calendar_view/calendar_view.dart';
import 'package:romaniz/resources/evento_resources.dart';

class AgendaViewModel {
  Future<List<CalendarEventData>> listar() async {
    final eventos = await EventoResources().listar();
    List<CalendarEventData> listOfCalendarEventData = eventos
        .map((e) => CalendarEventData(
              title: e.titulo,
              date: e.data,
              startTime: e.data,
              endTime: e.data.add(const Duration(hours: 1)),
            ))
        .toList();

    return listOfCalendarEventData;
  }
}
