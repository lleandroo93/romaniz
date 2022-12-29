import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:romaniz/model/dto/consulta/pessoa/consulta_pessoa_retorno_dto.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_viewmodel.dart';

class ContatosTableData extends StatelessWidget {
  const ContatosTableData({super.key});

  final columns = const <DataColumn>[
    DataColumn(label: Text('Nome')),
    DataColumn(label: Text('Telefone')),
    DataColumn(label: Text('Grupo')),
    DataColumn(label: Text('Endereço')),
    DataColumn(label: Text('')),
  ];

  final emptyRows = const <DataRow>[];

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
              return DataTable(columns: columns, rows: _toRows(snapshot.data));
          }
        });
  }

  _toRows(List<ConsultaPessoaRetornoDto>? data) {
    if (data == null || data.isEmpty) {
      return emptyRows;
    } else {
      return data
          .map((p) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(p.nome)),
                  DataCell(Text(p.telefone ?? '')),
                  DataCell(Text(p.grupo ?? '')),
                  DataCell(Text(p.endereco ?? '')),
                  DataCell(GestureDetector(onTap: () {}, child: const Icon(Icons.more_horiz)))
                ],
              ))
          .toList();
    }
  }
}
