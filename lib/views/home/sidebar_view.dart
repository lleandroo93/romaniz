import 'package:flutter/material.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/views/home/agenda/agenda_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_view.dart';
import 'package:romaniz/views/home/dashboard/dashboard_view.dart';

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
      child: Container(
        color: KColors.blueTransparent,
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
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => onSelectedRoute(DashboardView.route),
            ),
            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text('Agenda'),
              onTap: () => onSelectedRoute(AgendaView.route),
            ),
            ListTile(
              leading: const Icon(Icons.import_contacts_sharp),
              title: const Text('Pessoas'),
              onTap: () => onSelectedRoute(PesquisarContatosView.route),
            ),
            ListTile(
              title: const Text('Exatos'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
