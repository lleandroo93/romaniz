import 'package:flutter/material.dart';

class DashboardTabletView extends StatelessWidget {
  const DashboardTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: const [
                    DashboardMetricaNumerica(
                      icon: Icons.home,
                      metrica: '1524',
                      title: 'VISITAS REALIZADAS',
                    ),
                    DashboardMetricaNumerica(
                      icon: Icons.person,
                      metrica: '6250',
                      title: 'PESSOAS ALCANÇADAS',
                    ),
                    DashboardMetricaNumerica(
                      icon: Icons.assignment_ind,
                      metrica: '302',
                      title: 'LÍDERES',
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Ver relatório completo'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DashboardMetricaNumerica extends StatelessWidget {
  final IconData icon;
  final String metrica;
  final String title;

  const DashboardMetricaNumerica({Key? key, required this.icon, required this.metrica, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 36,
              ),
              Text(
                metrica,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ],
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
