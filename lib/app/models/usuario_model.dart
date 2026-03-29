class UsuarioModel {
  final String nome;
  final String login; // Pode ser e-mail
  final String senha;

  UsuarioModel({
    required this.nome,
    required this.login,
    required this.senha,
  });
}
