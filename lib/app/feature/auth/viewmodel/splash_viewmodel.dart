import 'package:flutter/material.dart';

class SplashViewmodel extends ChangeNotifier {
  Future<void> init(VoidCallback onFinish) async {
    await Future.delayed(const Duration(seconds: 3));
    onFinish();
  }
}
