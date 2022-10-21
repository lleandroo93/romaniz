import 'package:flutter/material.dart';
import 'package:romaniz/views/home/agenda/agenda_view.dart';
import 'package:romaniz/views/home/dashboard/dashboard_view.dart';
import 'package:romaniz/views/home/pessoas/cadastrar_pessoas_view.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.onSelectedRoute,
  });

  final void Function(String selectedRoute) onSelectedRoute;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 300, height: double.infinity),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ROMANIZ',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () => onSelectedRoute(DashboardView.route),
          ),
          ListTile(
            title: const Text('Agenda'),
            onTap: () => onSelectedRoute(AgendaView.route),
          ),
          ListTile(
            title: const Text('Pessoas'),
            onTap: () => onSelectedRoute(CadastrarPessoasView.route),
          ),
          ListTile(
            title: const Text('Exatos'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
