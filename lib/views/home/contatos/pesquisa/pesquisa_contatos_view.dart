import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romaniz/views/home/contatos/cadastro/simples/cadastrar_contato_simples_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_mobile_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_tablet_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_viewmodel.dart';

class PesquisarContatosView extends StatelessWidget {
  static const String route = 'contatos';

  const PesquisarContatosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<PesquisaContatosViewModel>(
      create: (context) => PesquisaContatosViewModel(),
      child: ScreenTypeLayout(
        mobile: PesquisarContatosMobile(),
        tablet: PesquisarContatosTablet(),
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
