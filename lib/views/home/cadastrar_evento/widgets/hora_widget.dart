import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romaniz/views/home/cadastrar_evento/widgets/horas.dart';

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
                items: horas
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
