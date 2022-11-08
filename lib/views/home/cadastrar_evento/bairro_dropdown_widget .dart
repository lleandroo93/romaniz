import 'package:flutter/material.dart';
import 'package:romaniz/model/bairro.dart';

class BairroDropDownWidget extends StatefulWidget {
  final List<Bairro> bairros;
  final void Function(Bairro? bairro) onChanged;

  const BairroDropDownWidget({
    super.key,
    required this.bairros,
    required this.onChanged,
  });

  @override
  State<BairroDropDownWidget> createState() => _BairroDropDownWidgetState();
}

class _BairroDropDownWidgetState extends State<BairroDropDownWidget> {
  Bairro? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Bairro>(
      value: dropdownValue,
      hint: const Text('Bairro'),
      decoration: const InputDecoration(
        label: Text('Bairro'),
        icon: Icon(Icons.maps_home_work),
      ),
      items: widget.bairros
          .map((bairro) => DropdownMenuItem(
                value: bairro,
                child: Text(bairro.nome),
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
