import 'package:flutter/material.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Requisito: Validação [3]
  final _loginCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();
  final _viewModel = LoginViewModel();

  void _tentarLogin() {
    if (_formKey.currentState!.validate()) {
      if (_viewModel.autenticar(_loginCtrl.text, _senhaCtrl.text)) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Diferencial: Mensagem de erro [4]
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciais inválidas!"), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _loginCtrl,
                decoration: const InputDecoration(labelText: "Login/E-mail"),
                validator: (v) => v!.isEmpty ? "Obrigatório" : null,
              ),
              TextFormField(
                controller: _senhaCtrl,
                decoration: const InputDecoration(labelText: "Senha"),
                obscureText: true,
                validator: (v) => v!.length < 3 ? "Mínimo 3 caracteres" : null,
              ),
              ElevatedButton(onPressed: _tentarLogin, child: const Text("Entrar")),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                child: const Text("Cadastrar-se"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
