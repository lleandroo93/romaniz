import 'package:flutter/material.dart';
import 'package:romaniz/views/home/agenda/agenda_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_view.dart';
import 'package:romaniz/views/home/dashboard/dashboard_view.dart';

class HomeMobileView extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Route Function(RouteSettings settings) onGenerateRoute;
  final void Function(String) onSelectedRoute;

  const HomeMobileView({
    super.key,
    required this.navigatorKey,
    required this.onGenerateRoute,
    required this.onSelectedRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: Drawer(
        child: ListView(
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
              onTap: () {
                Navigator.pop(context);
                onSelectedRoute(DashboardView.route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text('Agenda'),
              onTap: () {
                Navigator.pop(context);
                onSelectedRoute(AgendaView.route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.import_contacts_sharp),
              title: const Text('Pessoas'),
              onTap: () {
                Navigator.pop(context);
                onSelectedRoute(PesquisarContatosView.route);
              },
            ),
            ListTile(
              title: const Text('Exatos'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Navigator(
        key: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        initialRoute: DashboardView.route,
      ),
    );
  }
}
