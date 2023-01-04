import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:romaniz/model/dto/consulta/pessoa/consulta_pessoa_retorno_dto.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_viewmodel.dart';

class ContatosListView extends StatelessWidget {
  const ContatosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<PesquisaContatosViewModel>().listar(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const SizedBox();
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
            return Column(children: const [Center(child: CircularProgressIndicator())]);
          case ConnectionState.done:
            final contatos = snapshot.data;
            if (contatos == null) {
              return const Center(child: Text('Nenhum registro encontrado'));
            } else {
              return ListView.builder(
                itemCount: contatos.length,
                itemBuilder: (context, index) {
                  final contato = contatos[index];

                  return ListTile(
                    title: Text(contato.nome),
                    subtitle: Text(_generateSubtitle(contato)),
                  );
                },
              );
            }
        }
      },
    );
  }

  String _generateSubtitle(ConsultaPessoaRetornoDto contato) {
    final telefone = contato.telefone;
    final grupo = contato.grupo;

    String subtitle = '';

    if (telefone != null && telefone.isNotEmpty) {
      subtitle += telefone;
      if (grupo != null) {
        subtitle += ' - ';
      }
    }

    if (grupo != null) {
      subtitle += grupo;
    }

    return subtitle;
  }
}
