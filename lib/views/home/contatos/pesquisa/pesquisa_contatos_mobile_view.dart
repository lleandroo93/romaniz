import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/views/home/contatos/cadastro/simples/cadastrar_contato_simples_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/contatos_list_view.dart';

class PesquisarContatosMobile extends StatelessWidget {
  const PesquisarContatosMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          Flexible(child: ContatosListView()),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.search),
        TextButton(
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
      ],
    );
  }
}
