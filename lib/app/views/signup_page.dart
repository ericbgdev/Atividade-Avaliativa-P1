import 'package:flutter/material.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeCtrl = TextEditingController();
  final _loginCtrl = TextEditingController();
  final _senhaCtrl = TextEditing = TextEditingController();
  final _viewModel = SignupViewModel();

  void _finalizarCadastro() {
    if (_formKey.currentState!.validate()) {
      _viewModel.cadastrar(_nomeCtrl.text, _loginCtrl.text, _senhaCtrl.text);
      // Diferencial: Sucesso ao cadastrar [4]
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cadastrado com sucesso!"), backgroundColor: Colors.green),
      );
      Navigator.pop(context); // Retorno ao login [7]
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(controller: _nomeCtrl, decoration: const InputDecoration(labelText: "Nome")),
              TextFormField(controller: _loginCtrl, decoration: const InputDecoration(labelText: "Login")),
              TextFormField(controller: _senhaCtrl, decoration: const InputDecoration(labelText: "Senha"), obscureText: true),
              ElevatedButton(onPressed: _finalizarCadastro, child: const Text("Salvar")),
            ],
          ),
        ),
      ),
    );
  }
}
