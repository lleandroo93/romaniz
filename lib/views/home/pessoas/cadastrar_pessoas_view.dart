import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:romaniz/model/pessoa.dart';
import 'package:romaniz/views/home/pessoas/cadastrar_pessoas_viewmodel.dart';
import 'package:romaniz/widgets/bairro_dropdown_widget%20.dart';
import 'package:romaniz/widgets/municipio_dropdown_widget.dart';
import 'package:romaniz/widgets/my_text_form_widget.dart';

class CadastrarPessoasView extends StatefulWidget {
  static const String route = 'cadastrar-pessoas';
  const CadastrarPessoasView({super.key});

  @override
  State<CadastrarPessoasView> createState() => _CadastrarPessoasViewState();
}

class _CadastrarPessoasViewState extends State<CadastrarPessoasView> {
  bool loading = false;
  CadastrarPessoasViewModel viewModel = CadastrarPessoasViewModel();
  TextEditingController? _nomeController;
  TextEditingController? _grupoController;
  TextEditingController? _contatoController;
  TextEditingController? _resumoController;
  TextEditingController? _enderecoController;
  TextEditingController? _googleMapsController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _contatoController = TextEditingController();
    _grupoController = TextEditingController();
    _resumoController = TextEditingController();
    _enderecoController = TextEditingController();
    _googleMapsController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeController?.dispose();
    _contatoController?.dispose();
    _grupoController?.dispose();
    _resumoController?.dispose();
    _enderecoController?.dispose();
    _googleMapsController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: Column(
                children: [
                  const Text('CADASTRAR PESSOA', style: TextStyle(fontSize: 36, color: Colors.blue)),
                  MyTextFormWidget(iconData: Icons.abc, label: 'Nome', controller: _nomeController),
                  MyTextFormWidget(iconData: Icons.person, label: 'Grupo', controller: _grupoController),
                  MyTextFormWidget(iconData: Icons.phone, label: 'Contato', controller: _contatoController),
                  MyTextFormWidget(iconData: Icons.notes, label: 'Resumo', controller: _resumoController),
                  Observer(builder: (_) {
                    return MunicipioDropDownWidget(
                      cidades: viewModel.cidades,
                      onChanged: (cidade) => viewModel.cidadeSelecionada = cidade,
                    );
                  }),
                  Observer(builder: (_) {
                    return BairroDropDownWidget(
                      bairros: viewModel.bairros,
                      onChanged: (bairro) => viewModel.bairroSelecionado = bairro,
                    );
                  }),
                  MyTextFormWidget(iconData: Icons.pin_drop, label: 'Endereço', controller: _enderecoController),
                  MyTextFormWidget(
                      iconData: Icons.room_outlined, label: 'Google Maps', controller: _googleMapsController),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: ElevatedButton(onPressed: _cadastrar, child: const Text('Cadastrar pessoa')),
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
    await viewModel.cadastrar(Pessoa(
      nome: _nomeController?.text ?? 'CADASTRO INCOMPLETO',
      grupo: _grupoController?.text,
      contato: _contatoController?.text,
      resumo: _resumoController?.text,
      cidade: viewModel.cidadeSelecionada,
      bairro: viewModel.bairroSelecionado,
      endereco: _enderecoController?.text,
      googleMaps: _googleMapsController?.text,
    ));
    setState(() {
      loading = false;
      Navigator.pop(context);
    });
  }
}
