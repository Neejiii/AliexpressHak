import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/textfiled.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/pages/nav_bar.dart';
import 'package:mobile/pages/shop/shop_load.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Привет, давно не виделись!',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('Введи данные от своего акканта',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center),
                const SizedBox(height: 30),
                const MyTextField(text: 'Логин/Почта'),
                const MyTextField(text: 'Пароль'),
                const SizedBox(height: 20),
                MyButton(
                    text: 'Войти',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Navbar()));
                    }),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Container()));
                    },
                    child: const Text(
                      'регистрация',
                      style: TextStyle(
                          color: CColors.red,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
