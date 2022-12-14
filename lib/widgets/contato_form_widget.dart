import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:romaniz/model/dto/consulta/pessoa/consulta_pessoa_retorno_dto.dart';
import 'package:romaniz/resources/pessoa_repository.dart';

class ContatoFormWidget extends StatelessWidget {
  final void Function(ConsultaPessoaRetornoDto) onPessoaSelected;
  TextEditingController contatoController;

  ContatoFormWidget({
    Key? key,
    required this.onPessoaSelected,
    TextEditingController? controller,
  })  : contatoController = controller ?? TextEditingController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contato:',
          style: TextStyle(color: Color(0xFF565656)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 12),
          child: TypeAheadField<ConsultaPessoaRetornoDto>(
            suggestionsCallback: suggestionsCallback,
            itemBuilder: (context, pessoa) => ListTile(
              title: Text(pessoa.nome),
              subtitle: Text(pessoa.grupo ?? ''),
            ),
            onSuggestionSelected: (suggestion) {
              onPessoaSelected(suggestion);
              contatoController.text = suggestion.nome;
            },
            textFieldConfiguration: TextFieldConfiguration(
              controller: contatoController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: Icon(Icons.person),
                constraints: BoxConstraints(maxHeight: 28),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<List<ConsultaPessoaRetornoDto>> suggestionsCallback(String pattern) {
    return ContatoRepository().pesquisarPorNome(pattern, limit: 10);
  }
}
