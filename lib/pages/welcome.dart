import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/pages/auth/auth_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) => const AuthPage()),
      ),
    );
    return const Scaffold(
      body: Center(
        child: Text(
          'Добро пожаловать. Удачных покупок!',
          style: TextStyle(color: CColors.red, fontSize: 24),textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
