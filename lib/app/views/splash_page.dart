import 'package:flutter/material.dart';
import '../viewmodels/splash_viewmodel.dart'; // Importe a ViewModel

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _viewModel = SplashViewModel(); // Instância da ViewModel

  @override
  void initState() {
    super.initState();
    // A View pede para a ViewModel iniciar a lógica de espera
    _viewModel.inicializar(() {
      // Quando a lógica da ViewModel termina, a View executa a navegação
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.rocket_launch, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Sistema ADS',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
