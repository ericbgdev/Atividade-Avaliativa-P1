App Login-Cadastro MVVM — Flutter
Aplicativo Flutter desenvolvido como atividade avaliativa P1 da disciplina Desenvolvimento Mobile. Implementa um fluxo completo de autenticação (login e cadastro) utilizando o padrão de arquitetura MVVM com gerenciamento de estado via ChangeNotifier.

👥 Integrantes

Eric Butzloff Gudera — RA: 25001129
Ícaro Cauã Guminiak de Godoy — RA: 25000026

Professor: Marcelo Ciacco
Disciplina: Desenvolvimento Mobile

📋 Sobre o Projeto
Este é um aplicativo Flutter que demonstra boas práticas de desenvolvimento mobile, com foco em arquitetura limpa e separação de responsabilidades. O app implementa um sistema completo de autenticação (login e cadastro) com persistência de dados em memória através de um mock store.
Principais características:

Fluxo de autenticação completo (splash → login → cadastro → home)
Validação de formulários com feedback visual
Indicadores de carregamento durante operações
Alternância de visibilidade de senha
Mensagens de erro e sucesso via SnackBar
Padrão MVVM com ChangeNotifier para reatividade


🏗️ Arquitetura MVVM
O projeto segue o padrão MVVM (Model-View-ViewModel) com separação clara de responsabilidades:
lib/
├── main.dart
└── app/
    ├── app_widget.dart                      # Widget raiz e MaterialApp
    ├── data/
    │   └── usuario_mock_store.dart          # Armazenamento em memória (singleton)
    ├── feature/
    │   └── auth/
    │       ├── model/
    │       │   └── user_model.dart          # Modelo de dados do usuário
    │       ├── view/
    │       │   ├── splash_page.dart         # Tela de splash (3s)
    │       │   ├── login_page.dart          # Tela de login
    │       │   ├── register_page.dart       # Tela de cadastro
    │       │   └── home_page.dart           # Tela inicial pós-login
    │       └── viewmodel/
    │           ├── splash_viewmodel.dart    # Lógica da splash
    │           ├── login_viewmodel.dart     # Lógica de autenticação
    │           ├── register_viewmodel.dart  # Lógica de cadastro
    │           └── home_viewmodel.dart      # Lógica da home
    └── routes/
        ├── app_routes.dart                  # Constantes de rotas
        └── app_pages.dart                   # Mapeamento de rotas
Padrão MVVM:

Model: Classes de dados (UserModel)
View: Páginas Flutter (StatefulWidget)
ViewModel: Lógica de negócio com ChangeNotifier


🖥️ Telas da Aplicação
Splash Screen

Exibida por 3 segundos ao iniciar
Ícone e título animados
Navega automaticamente para a tela de login

Login

Campos de e-mail e senha com validação
Botão para alternar visibilidade da senha
Indicador de carregamento durante autenticação
Feedback de erro via SnackBar
Link de navegação para cadastro

Cadastro

Campos de nome, e-mail e senha
Validação de campos obrigatórios
Alternância de visibilidade da senha
Confirmação de sucesso via SnackBar
Redirecionamento automático para login

Home

Mensagem de boas-vindas personalizada
Exibição do nome do usuário logado
Botão de logout com ícone
Design limpo e intuitivo


✅ Funcionalidades

✅ Splash screen com delay de 3 segundos
✅ Formulário de login com validação em tempo real
✅ Formulário de cadastro com validação
✅ Alternância de visibilidade de senha
✅ Feedback visual (SnackBar) para erros e sucessos
✅ Indicador de carregamento simulado (Future.delayed)
✅ Armazenamento em memória via singleton pattern
✅ Navegação entre telas com rotas nomeadas
✅ Arquitetura MVVM com ChangeNotifier
✅ Separação clara entre camadas (Model, View, ViewModel)


⚠️ Pontos de Atenção e Melhorias Recomendadas
1. Nome do Usuário não Persistido na Home
Problema: Em app_pages.dart, a rota /home instancia HomePage com nomeUsuario: '' vazio.
Solução recomendada:
dart// login_page.dart
Navigator.pushReplacementNamed(
  context,
  AppRoutes.home,
  arguments: usuario!.name,
);

// app_pages.dart
AppRoutes.home: (context) {
  final nome = ModalRoute.of(context)!.settings.arguments as String? ?? '';
  return HomePage(nomeUsuario: nome);
},
2. Propriedade AppBar Incorreta
Problema: home_page.dart usa automaticallyImplyActions (inválido).
Solução:
dartautomaticallyImplyLeading: false,
3. Estrutura Duplicada
Problema: Existe uma versão legada em lib/app/views/ e lib/app/viewmodels/ não utilizada.
Recomendação: Remover os diretórios legados para evitar confusão:
bashrm -rf lib/app/views
rm -rf lib/app/viewmodels
rm -rf lib/app/models
4. Singleton Store Inconsistente
Problema: lib/app/viewmodels/login_viewmodel.dart usa UsuarioMockStore() (nova instância) em vez do singleton.
Solução: Usar UsuarioMockStore.instance em todos os lugares.

🚀 Como Executar
Pré-requisitos

Flutter SDK versão 3.18.0 ou superior
Dart SDK versão 3.11.0 ou superior
Android Studio, VS Code ou Xcode (para simuladores)
Emulador Android ou iOS, ou dispositivo físico

Passos de Instalação

Clone o repositório:

bashgit clone https://github.com/seu-usuario/flutter_application_1.git
cd flutter_application_1

Instale as dependências:

bashflutter pub get

Execute o aplicativo:

bashflutter run
Ou em modo release:
bashflutter run --release
Executar em Plataformas Específicas
bash# iOS
flutter run -d iphone

# Android
flutter run -d android

# Web (requer ativação)
flutter run -d web

📦 Dependências
PacoteVersãoUsoflutterSDKFramework principalvalidatorless^1.2.5Utilitários de validação de formuláriosflutter_lints^6.0.0Regras de lint recomendadas
Como Adicionar Novas Dependências
bashflutter pub add nome_do_pacote

🔧 Tecnologias Utilizadas

Flutter — Framework UI multiplataforma
Dart — Linguagem de programação
MVVM — Padrão de arquitetura
ChangeNotifier — Gerenciamento de estado reativo
Named Routes — Navegação por rotas nomeadas
Material Design — Design system do Google


📝 Como Usar a Aplicação
Primeiro Acesso

A splash screen será exibida por 3 segundos
Você será redirecionado para a tela de login
Clique em "Cadastre-se" para criar uma conta

Cadastro

Preencha os campos: Nome, Email e Senha
Clique em "Cadastrar"
Você será redirecionado para o login

Login

Insira o email e senha cadastrados
Clique em "Entrar"
Você será levado à tela inicial

Home

Veja a mensagem de boas-vindas personalizada
Clique no ícone de logout (canto superior direito) para retornar ao login


🧪 Estrutura de Validação
Email

Campo obrigatório
Deve conter o caractere @

Senha

Campo obrigatório
Mínimo de 6 caracteres

Nome (Cadastro)

Campo obrigatório


📂 Estrutura de Arquivos Importante
lib/
├── app/
│   ├── data/usuario_mock_store.dart
│   │   └── Gerencia armazenamento de usuários em memória
│   ├── feature/auth/
│   │   ├── model/user_model.dart
│   │   ├── view/
│   │   │   ├── login_page.dart
│   │   │   ├── register_page.dart
│   │   │   └── home_page.dart
│   │   └── viewmodel/
│   │       ├── login_viewmodel.dart
│   │       └── register_viewmodel.dart
│   └── routes/
│       ├── app_routes.dart (constantes)
│       └── app_pages.dart (mapeamento)
└── main.dart
