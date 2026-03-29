import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/usuario_mock_store.dart';
import 'package:flutter_application_1/app/feature/auth/model/user_model.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  bool get obscurePassword => _obscurePassword;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return 'Informe o nome';
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Informe o e-mail';
    if (!value.contains('@')) return 'E-mail inválido';
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Informe a senha';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  Future<bool> register() async {
    if (!formKey.currentState!.validate()) return false;

    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    UsuarioMockStore.instance.adicionar(user);

    _isLoading = false;
    notifyListeners();

    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
