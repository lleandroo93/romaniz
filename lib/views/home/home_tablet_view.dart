import 'package:flutter/material.dart';
import 'package:romaniz/views/home/dashboard/dashboard_view.dart';
import 'package:romaniz/views/home/sidebar_view.dart';

class HomeTabletView extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Route Function(RouteSettings settings) onGenerateRoute;
  final void Function(String) onSelectedRoute;

  const HomeTabletView({
    super.key,
    required this.navigatorKey,
    required this.onGenerateRoute,
    required this.onSelectedRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(onSelectedRoute: onSelectedRoute),
          Expanded(
            child: Navigator(
              key: navigatorKey,
              initialRoute: DashboardView.route,
              onGenerateRoute: onGenerateRoute,
            ),
          )
        ],
      ),
    );
  }
}
