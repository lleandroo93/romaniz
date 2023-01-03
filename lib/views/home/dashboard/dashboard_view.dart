import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romaniz/views/home/dashboard/dashboard_mobile_view.dart';
import 'package:romaniz/views/home/dashboard/dashboard_tablet_view.dart';

class DashboardView extends StatelessWidget {
  static const String route = 'dashboard';
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DashboardMobileView(),
      tablet: DashboardTabletView(),
    );
  }
}
