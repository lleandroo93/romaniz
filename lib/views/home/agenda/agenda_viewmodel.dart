import 'package:calendar_view/calendar_view.dart';
import 'package:romaniz/model/dto/consulta/evento/consulta_evento_retorno_dto.dart';
import 'package:romaniz/resources/evento_resources.dart';

class AgendaViewModel {
  Future<List<CalendarEventData>> listar() async {
    final eventos = await EventoResources().listar();
    List<CalendarEventData<ConsultaEventoRetornoDto>> listOfCalendarEventData = eventos
        .map((e) => CalendarEventData(
              title: e.titulo,
              event: e,
              date: DateTime.fromMillisecondsSinceEpoch(e.data),
              startTime: DateTime.fromMillisecondsSinceEpoch(e.data),
              endTime: DateTime.fromMillisecondsSinceEpoch(e.data).add(const Duration(hours: 1)),
            ))
        .toList();

    return listOfCalendarEventData;
  }
}
