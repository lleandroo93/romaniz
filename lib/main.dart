import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:romaniz/views/home/home_view.dart';
import 'package:romaniz/views/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeView(),
        )
      ],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginView(),
      routerConfig: _router,
      // onGenerateRoute: (settings) {
      //   late Widget page;
      //   if (settings.name == LoginView.route) {
      //     page = LoginView();
      //   } else if (settings.name!.startsWith(HomeView.routePrefixHome)) {
      //     final subRoute = settings.name!.substring(HomeView.routePrefixHome.length);
      //     page = HomeView(
      //       setupPageRoute: subRoute,
      //     );
      //   }
      //   return MaterialPageRoute<dynamic>(
      //     builder: (context) {
      //       return page;
      //     },
      //     settings: settings,
      //   );
      // },
    );
  }
}
