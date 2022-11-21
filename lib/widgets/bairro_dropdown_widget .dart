import 'package:dropdown_search/dropdown_search.dart';
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
    return DropdownSearch<Bairro>(
      items: widget.bairros,
      onChanged: (value) {
        setState(() {
          dropdownValue = value;
        });
        widget.onChanged(value);
      },
      popupProps: const PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: true,
        searchFieldProps: TextFieldProps(autofocus: true),
      ),
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: 'Bairro',
          icon: Icon(Icons.maps_home_work),
        ),
      ),
      compareFn: (item1, item2) => item1.nome == item2.nome,
      itemAsString: (item) => item.nome,
    );
    // return DropdownButtonFormField<Bairro>(
    //   value: dropdownValue,
    //   hint: const Text('Bairro'),
    //   decoration: const InputDecoration(
    //     label: Text('Bairro'),
    //     icon: Icon(Icons.maps_home_work),
    //   ),
    //   items: widget.bairros
    //       .map((bairro) => DropdownMenuItem(
    //             value: bairro,
    //             child: Text(bairro.nome),
    //           ))
    //       .toList(),
    //   onChanged: (value) {
    //     setState(() {
    //       dropdownValue = value!;
    //     });
    //     widget.onChanged(value);
    //   },
    // );
  }
}
