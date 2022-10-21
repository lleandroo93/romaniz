import 'package:flutter/material.dart';

class CadastrarPessoasView extends StatelessWidget {
  static const String route = 'cadastrar-pessoas';
  const CadastrarPessoasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Column(
          children: [
            const Text('CADASTRAR PESSOA', style: TextStyle(fontSize: 36, color: Colors.blue)),
            const _FormWidget(iconData: Icons.abc, label: 'Nome'),
            const _FormWidget(iconData: Icons.person, label: 'Grupo'),
            const _FormWidget(iconData: Icons.date_range, label: 'Contato'),
            const _FormWidget(iconData: Icons.notes, label: 'Resumo'),
            const _FormWidget(iconData: Icons.map, label: 'Município'),
            const _FormWidget(iconData: Icons.maps_home_work, label: 'Bairro'),
            const _FormWidget(iconData: Icons.pin_drop, label: 'Endereço'),
            const _FormWidget(iconData: Icons.room_outlined, label: 'Google Maps'),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: ElevatedButton(onPressed: () {}, child: const Text('Cadastrar pessoa')),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  const _FormWidget({
    super.key,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              label: Text(label),
              icon: Icon(iconData),
            ),
          ),
        ),
      ],
    );
  }
}
