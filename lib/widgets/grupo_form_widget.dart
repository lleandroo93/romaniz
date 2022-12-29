import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:romaniz/model/dto/consulta/grupo/consulta_grupo_retorno_dto.dart';
import 'package:romaniz/resources/grupo_repository.dart';

class GrupoFormWidget extends StatelessWidget {
  final void Function(ConsultaGrupoRetornoDto grupo) onGrupoSelected;
  TextEditingController grupoController;

  GrupoFormWidget({
    super.key,
    required this.onGrupoSelected,
    TextEditingController? controller,
  }) : grupoController = controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Grupo:',
          style: TextStyle(color: Color(0xFF565656)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 12),
          child: TypeAheadField<ConsultaGrupoRetornoDto>(
            suggestionsCallback: suggestionsCallback,
            itemBuilder: (context, grupo) => ListTile(title: Text(grupo.nome)),
            onSuggestionSelected: (suggestion) {
              onGrupoSelected(suggestion);
              grupoController.text = suggestion.nome;
            },
            textFieldConfiguration: TextFieldConfiguration(
              controller: grupoController,
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

  Future<List<ConsultaGrupoRetornoDto>> suggestionsCallback(String pattern) {
    return GrupoRepository().pesquisarPorNome(pattern, limit: 10);
  }
}
