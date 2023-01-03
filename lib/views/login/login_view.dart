import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  static const String route = '/login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size(400, 400)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ROMANIZ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Login'),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Senha'),
                          prefixIcon: Icon(Icons.lock_rounded),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Esqueci minha senha'),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Criar conta'),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => GoRouter.of(context).go("/home"),
                              //Navigator.of(context).pushNamed(HomeView.routePrefixHome + DashboardView.route),
                              child: const Text('Entrar'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
