import '../data/usuario_mock_store.dart';

class LoginViewModel {
  final _store = UsuarioMockStore();

  bool autenticar(String login, String senha) {
    final usuario = _store.buscar(login, senha);
    return usuario != null;
  }
}
