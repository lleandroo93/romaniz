import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:romaniz/views/home/dashboard/dashboard_view.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 1);
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            items: [
              const SideMenuItem(
                priority: 0,
                title: 'MENU DE NAVEGAÇÃO',
              ),
              SideMenuItem(
                priority: 1,
                title: 'Dashboard',
                onTap: () => pageController.jumpToPage(1),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Agenda',
                onTap: () => pageController.jumpToPage(2),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Pessoas',
                onTap: () => pageController.jumpToPage(3),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Exatos',
                onTap: () => pageController.jumpToPage(4),
              ),
            ],
            controller: pageController,
            title: const Padding(
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
                  )),
            ),
            style: SideMenuStyle(),
          ),
          Expanded(
              child: PageView(
            controller: pageController,
            children: [
              Container(),
              const DashboardView(),
              const Center(child: Text('Agenda')),
              const Center(child: Text('Pessoas')),
              const Center(child: Text('Exatos')),
            ],
          )),
        ],
      ),
    );
  }
}
