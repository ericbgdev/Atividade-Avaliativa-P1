class SplashViewModel {
  // Lógica de negócio da Splash: aguardar o tempo definido (ex: 3 segundos)
  // e então executar uma função de retorno (callback)
  void inicializar(Function onComplete) {
    Future.delayed(const Duration(seconds: 3), () {
      onComplete();
    });
  }
}
