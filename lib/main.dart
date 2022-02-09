import 'package:flutter/material.dart';
import 'package:mobile/components/theme.dart';
import 'package:mobile/models/singleton.dart';
import 'package:mobile/pages/auth/auth_page.dart';
import 'package:provider/provider.dart';
import 'package:mobile/pages/compilations/new_compilation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SingletonProvider>(
            create: (context) => SingletonProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: CColors.dark_grey),
        ),
        home: const Scaffold(
          body: SafeArea(
            child: NewCompilation(),
          ),
        ),
      ),
    );
  }
}
