import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class SignupViewModel {
  final _store = UsuarioMockStore();

  void cadastrar(String nome, String login, String senha) {
    final novo = UsuarioModel(nome: nome, login: login, senha: senha);
    _store.adicionar(novo);
  }
}
