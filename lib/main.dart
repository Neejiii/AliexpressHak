import 'package:flutter/material.dart';
import 'package:mobile/pages/auth/auth_page.dart';
import 'package:provider/provider.dart';
import 'models/catalogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CatalogsModel>(
            create: (context) => CatalogsModel(catalogs: []))
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: AuthPage(),
          ),
        ),
      ),
    );
  }
}
