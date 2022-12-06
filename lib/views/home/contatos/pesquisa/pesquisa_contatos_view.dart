import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/views/home/contatos/pesquisa/contatos_table_data.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_viewmodel.dart';
import 'package:romaniz/views/home/pessoas/cadastrar_pessoas_view.dart';

class PesquisarContatosView extends StatelessWidget {
  static const String route = 'contatos';

  const PesquisarContatosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<PesquisaContatosViewModel>(
      create: (context) => PesquisaContatosViewModel(),
      child: Padding(
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
          onPressed: () => showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: CadastrarPessoasView(),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
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
