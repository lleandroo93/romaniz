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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Bairro',
          style: TextStyle(color: Color(0xFF565656)),
        ),
        const SizedBox(height: 4),
        DropdownSearch<Bairro>(
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
              focusColor: Colors.transparent,
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
          ),
          compareFn: (item1, item2) => item1.nome == item2.nome,
          itemAsString: (item) => item.nome,
        ),
        const SizedBox(height: 13),
      ],
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
