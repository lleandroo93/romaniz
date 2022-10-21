import 'package:flutter/material.dart';

class CadastrarEventoView extends StatelessWidget {
  static const String route = 'cadastrar-evento';
  const CadastrarEventoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Column(
          children: [
            const Text('CADASTRAR EVENTO', style: TextStyle(fontSize: 36, color: Colors.blue)),
            const _FormWidget(iconData: Icons.abc, label: 'Nome do evento'),
            const _FormWidget(iconData: Icons.person, label: 'Contato'),
            const _FormWidget(iconData: Icons.date_range, label: 'Data do agendamento'),
            const _FormWidget(iconData: Icons.notes, label: 'Resumo'),
            const _FormWidget(iconData: Icons.map, label: 'Município'),
            const _FormWidget(iconData: Icons.maps_home_work, label: 'Bairro'),
            const _FormWidget(iconData: Icons.pin_drop, label: 'Endereço'),
            const _FormWidget(iconData: Icons.comment, label: 'Observações'),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: ElevatedButton(onPressed: () {}, child: const Text('Cadastrar evento')),
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
