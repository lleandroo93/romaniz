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
    return DropdownButtonFormField<Cidade>(
      value: dropdownValue,
      hint: const Text('Município'),
      decoration: const InputDecoration(
        label: Text('Município'),
        icon: Icon(Icons.map),
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
    );
  }
}
