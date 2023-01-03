import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romaniz/views/home/agenda/agenda_mobile_view.dart';
import 'package:romaniz/views/home/agenda/agenda_tablet_view.dart';
import 'package:romaniz/views/home/agenda/agenda_viewmodel.dart';

class AgendaView extends StatelessWidget {
  static const String route = 'agenda';
  const AgendaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AgendaViewModel>(
      create: (context) => AgendaViewModel(),
      child: ScreenTypeLayout(
        mobile: AgendaMobileView(),
        tablet: AgendaTabletView(),
      ),
    );
  }
}
