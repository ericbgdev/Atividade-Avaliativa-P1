import 'package:flutter_application_1/app/feature/auth/model/user_model.dart';

class UsuarioMockStore {
  static final UsuarioMockStore instance = UsuarioMockStore._();
  UsuarioMockStore._();

  final List<UserModel> usuarios = [];

  void adicionar(UserModel user) {
    usuarios.add(user);
  }

  UserModel? buscar(String email, String password) {
    try {
      return usuarios.firstWhere(
        (u) => u.email == email && u.password == password,
      );
    } catch (_) {
      return null;
    }
  }
}
