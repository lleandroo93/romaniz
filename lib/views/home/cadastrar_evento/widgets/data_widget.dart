import 'package:flutter/material.dart';
import 'package:romaniz/widgets/my_text_form_widget.dart';

String _formatDateString(final DateTime? date) {
  if (date != null) {
    return '${date.day}/${date.month}/${date.year}';
  } else {
    return '';
  }
}

class DataWidget extends StatelessWidget {
  final TextEditingController? dataAgendamentoController;
  final void Function(DateTime value) onChanged;
  DateTime? data;

  DataWidget({
    Key? key,
    required this.dataAgendamentoController,
    required this.onChanged,
    this.data,
  }) : super(key: key) {
    dataAgendamentoController?.text = _formatDateString(data);
  }

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
            dataAgendamentoController?.text = _formatDateString(selectedDate);
            onChanged(selectedDate);
          }
        },
        child: IgnorePointer(
          child: MyTextFormWidget(
              iconData: Icons.date_range, label: 'Data do agendamento', controller: dataAgendamentoController),
        ),
      ),
    );
  }
}
