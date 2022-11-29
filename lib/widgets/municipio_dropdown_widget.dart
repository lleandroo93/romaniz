import 'package:flutter/material.dart';
import 'package:romaniz/model/cidade.dart';

class MunicipioDropDownWidget extends StatefulWidget {
  final List<Cidade> cidades;
  final void Function(Cidade? cidade) onChanged;

  const MunicipioDropDownWidget({
    super.key,
    required this.cidades,
    required this.onChanged,
  });

  @override
  State<MunicipioDropDownWidget> createState() => _MunicipioDropDownWidgetState();
}

class _MunicipioDropDownWidgetState extends State<MunicipioDropDownWidget> {
  Cidade? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Município',
          style: TextStyle(color: Color(0xFF565656)),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<Cidade>(
          value: dropdownValue,
          focusColor: Colors.transparent,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1),
            ),
            constraints: BoxConstraints(maxHeight: 28),
          ),
          items: widget.cidades
              .map((cidade) => DropdownMenuItem(
                    value: cidade,
                    child: Text(cidade.nome),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              dropdownValue = value!;
            });
            widget.onChanged(value);
          },
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}
