import '../models/usuario_model.dart';

class UsuarioMockStore {
  // Lista em memória exigida [5, 7]
  final List<UsuarioModel> _usuarios = [];

  // Singleton: instância única para todo o app [6]
  static final UsuarioMockStore _instance = UsuarioMockStore._internal();
  factory UsuarioMockStore() => _instance;
  UsuarioMockStore._internal();

  void adicionar(UsuarioModel usuario) => _usuarios.add(usuario);

  UsuarioModel? buscar(String login, String senha) {
    try {
      return _usuarios.firstWhere(
        (u) => u.login == login && u.senha == senha
      );
    } catch (e) {
      return null;
    }
  }
}
