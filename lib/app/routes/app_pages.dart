import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes/app_routes.dart';

import '../feature/auth/view/splash_page.dart';
import '../feature/auth/view/login_page.dart';
import '../feature/auth/view/register_page.dart';
import '../feature/auth/view/home_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.home: (_) => const HomePage(nomeUsuario: ''),
  };
}
