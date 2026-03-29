import 'package:flutter/material.dart';
import 'app/views/splash_page.dart';
import 'app/views/login_page.dart';
import 'app/views/signup_page.dart';
import 'app/views/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Requisito: Splash é a primeira [2]
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
