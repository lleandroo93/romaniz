import 'package:flutter/material.dart';
import 'package:romaniz/views/home/home_view.dart';
import 'package:romaniz/views/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == LoginView.route) {
          page = LoginView();
        } else if (settings.name!.startsWith(HomeView.routePrefixHome)) {
          final subRoute = settings.name!.substring(HomeView.routePrefixHome.length);
          page = HomeView(
            setupPageRoute: subRoute,
          );
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    );
  }
}
