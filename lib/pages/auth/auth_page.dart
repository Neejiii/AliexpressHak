import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/textfiled.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/http_client.dart';
import 'package:mobile/pages/nav_bar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController first = TextEditingController();
    TextEditingController second = TextEditingController();
    return Scaffold(
      backgroundColor: CColors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Stinger',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                const FittedBox(
                  child: Text('Добро пожаловать!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                const Text('Войдите, чтобы продолжить',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center),
                const SizedBox(height: 40),
                MyTextField(text: 'Логин/Почта', controller: first),
                MyTextField(text: 'Пароль', controller: second),
                const SizedBox(height: 20),
                MyButton(
                    text: 'Войти',
                    onTap: () {
                      HttpClient()
                          .login(context, first.text, second.text)
                          .then((value) => {
                                if (value != null)
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Navbar()))
                              });
                    }),
                TextButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Container()));
                    },
                    child: const Text(
                      'регистрация',
                      style: TextStyle(
                          color: CColors.grey,
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
