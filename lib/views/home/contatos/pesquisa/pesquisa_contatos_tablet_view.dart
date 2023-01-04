import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/views/home/contatos/cadastro/simples/cadastrar_contato_simples_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/contatos_table_data.dart';

class PesquisarContatosTablet extends StatelessWidget {
  const PesquisarContatosTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seus contatos',
            style: GoogleFonts.roboto(
              color: KColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 40,
            ),
          ),
          BotaoNovoContato(),
          SizedBox(height: 20),
          ContatosTableData(),
        ],
      ),
    );
  }
}

class BotaoNovoContato extends StatelessWidget {
  const BotaoNovoContato({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: CadastrarContatoSimplesView(),
                contentPadding: EdgeInsets.zero,
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add),
              Text('Novo contato'),
            ],
          )),
    );
  }
}
