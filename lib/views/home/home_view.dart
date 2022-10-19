import 'package:flutter/material.dart';
import 'package:romaniz/views/home/agenda/agenda_view.dart';
import 'package:romaniz/views/home/dashboard/dashboard_view.dart';
import 'package:romaniz/views/home/sidebar_view.dart';

class HomeView extends StatefulWidget {
  static const String routePrefixHome = '/home/';

  final String setupPageRoute;

  const HomeView({
    super.key,
    required this.setupPageRoute,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  void _onSelectedRoute(String route) {
    _navigatorKey.currentState!.pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(onSelectedRoute: _onSelectedRoute),
          Expanded(
            child: Navigator(
              key: _navigatorKey,
              initialRoute: DashboardView.route,
              onGenerateRoute: _onGenerateRoute,
            ),
          )
        ],
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
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
