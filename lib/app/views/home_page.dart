import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center( // Requisito: Ícone e texto centralizado [6]
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 100, color: Colors.blue),
            Text("Bem-vindo à Home", style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
