import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:romaniz/constants.dart';
import 'package:romaniz/views/home/dashboard/charts/chart_idade.dart';
import 'package:romaniz/views/home/dashboard/charts/chart_sexo.dart';

class DashboardMobileView extends StatelessWidget {
  const DashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Perfil dos contatos', style: KTextStyles.titulo),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Total de contatos cadastrados'),
                      Text(
                        '1324',
                        style: KTextStyles.titulo.copyWith(fontSize: 24),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            ChartSexo(),
            SizedBox(height: 24),
            ChartIdade(),
          ],
        ),
      ),
    );
  }
}
