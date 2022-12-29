import 'package:flutter/material.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/model/dto/cadastro/contato/simples/cadastro_contato_simples_dto.dart';
import 'package:romaniz/views/home/contatos/cadastro/completo/cadastrar_contato_completo_view.dart';
import 'package:romaniz/views/home/contatos/cadastro/simples/cadastrar_contato_simples_viewmodel.dart';
import 'package:romaniz/widgets/my_text_form_widget.dart';

class CadastrarContatoSimplesView extends StatefulWidget {
  static const String route = 'cadastrar-pessoas';
  const CadastrarContatoSimplesView({super.key});

  @override
  State<CadastrarContatoSimplesView> createState() => _CadastrarContatoSimplesViewState();
}

class _CadastrarContatoSimplesViewState extends State<CadastrarContatoSimplesView> {
  bool loading = false;
  CadastrarContatoSimplesViewModel viewModel = CadastrarContatoSimplesViewModel();
  TextEditingController? _nomeController;
  TextEditingController? _contatoController;
  TextEditingController? _resumoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _contatoController = TextEditingController();
    _resumoController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeController?.dispose();
    _contatoController?.dispose();
    _resumoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 4,
                    left: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        navigatorKey.currentState!.pushNamed(CadastrarContatoCompletoView.route);
                      },
                      child: const Icon(
                        Icons.open_in_full,
                        color: KColors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text('Novo contato', style: KTextStyles.titulo),
                            ),
                            GestureDetector(onTap: () => Navigator.of(context).pop(), child: const Icon(Icons.close))
                          ],
                        ),
                        MyTextFormWidget(iconData: Icons.abc, label: 'Nome', controller: _nomeController),
                        MyTextFormWidget(iconData: Icons.phone, label: 'Contato', controller: _contatoController),
                        MyTextFormWidget(iconData: Icons.notes, label: 'Resumo', controller: _resumoController),
                        Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: SizedBox(
                            width: 160,
                            child: ElevatedButton(
                              onPressed: _cadastrar,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF63C554),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Text('Salvar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _cadastrar() async {
    setState(() {
      loading = true;
    });
    await viewModel.cadastrar(CadastroContatoSimplesDto(
      nome: _nomeController?.text ?? 'CADASTRO INCOMPLETO',
      telefone: _contatoController?.text,
      resumo: _resumoController?.text,
    ));
    setState(() {
      loading = false;
      Navigator.pop(context);
    });
  }
}
