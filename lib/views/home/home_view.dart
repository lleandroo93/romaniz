import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/views/home/agenda/agenda_view.dart';
import 'package:romaniz/views/home/cadastrar_evento/cadastrar_evento_view.dart';
import 'package:romaniz/views/home/contatos/cadastro/completo/cadastrar_contato_completo_view.dart';
import 'package:romaniz/views/home/contatos/cadastro/simples/cadastrar_contato_simples_view.dart';
import 'package:romaniz/views/home/contatos/pesquisa/pesquisa_contatos_view.dart';
import 'package:romaniz/views/home/dashboard/dashboard_view.dart';
import 'package:romaniz/views/home/home_mobile_view.dart';
import 'package:romaniz/views/home/home_tablet_view.dart';
import 'package:romaniz/views/home/sidebar_view.dart';

class HomeView extends StatefulWidget {
  static const String routePrefixHome = '/home/';

  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final _navigatorKey = GlobalKey<NavigatorState>();
  final _navigatorKey = navigatorKey;

  void _onSelectedRoute(String route) {
    _navigatorKey.currentState!.pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeMobileView(
        navigatorKey: _navigatorKey,
        onGenerateRoute: _onGenerateRoute,
        onSelectedRoute: _onSelectedRoute,
      ),
      tablet: HomeTabletView(
        navigatorKey: _navigatorKey,
        onGenerateRoute: _onGenerateRoute,
        onSelectedRoute: _onSelectedRoute,
      ),
    );
  }
}

Route _onGenerateRoute(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case DashboardView.route:
      page = const DashboardView();
      break;
    case AgendaView.route:
      page = const AgendaView();
      break;
    case CadastrarEventoView.route:
      page = CadastrarEventoView(dataEvento: DateTime.now());
      break;
    case CadastrarContatoSimplesView.route:
      page = const CadastrarContatoSimplesView();
      break;
    case PesquisarContatosView.route:
      page = const PesquisarContatosView();
      break;
    case CadastrarContatoCompletoView.route:
      page = const CadastrarContatoCompletoView();
      break;
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
