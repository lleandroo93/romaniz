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
    return PessoaRepository().pesquisarPorNome(pattern, limit: 10);
  }
}

class _PesquisaContato extends StatefulWidget {
  const _PesquisaContato({super.key});

  @override
  State<_PesquisaContato> createState() => __PesquisaContatoState();
}

class __PesquisaContatoState extends State<_PesquisaContato> {
  Timer? timer;
  List<String> contatos = [];
  Widget _resultWidget = Text('Digite para começar a pesquisa');

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _search(String value) async {
    timer = null;

    setState(() {
      _resultWidget = Center(child: CircularProgressIndicator());
    });

    await Future.delayed(Duration(milliseconds: 500)); // simula ida a api fazer pesquisa
    contatos = ['${value}a', '${value}b', '${value}c'];

    setState(() {
      _resultWidget = ListView(
        shrinkWrap: true,
        primary: false,
        children: contatos
            .map((e) => ListTile(
                  title: Text(e),
                ))
            .toList(),
      );
    });

    debugPrint(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          autofocus: true,
          onChanged: (value) {
            timer?.cancel();
            timer = Timer(Duration(seconds: 1), () => _search(value));
          },
          decoration: const InputDecoration(
              label: Text('Pesquisar'),
              icon: Icon(
                Icons.search,
              )),
        ),
        ListView(
          shrinkWrap: true,
          primary: false,
          children: contatos
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        )
      ],
    );
  }
}
