# App Login-Cadastro MVVM — Flutter

# Atividade Avaliativa P1
# Disciplina: Desenvolvimento Mobile
# Professor: Marcelo Ciacco


👥 Integrantes
NomeRAEric Butzloff Gudera25001129Ícaro Cauã Guminiak de Godoy25000026

📋 Sobre o Projeto
Aplicativo Flutter desenvolvido como atividade avaliativa P1, implementando um fluxo completo de autenticação (login e cadastro) utilizando o padrão de arquitetura MVVM (Model-View-ViewModel) com gerenciamento de estado via ChangeNotifier.
O app simula persistência de dados em memória por meio de um store mock (UsuarioMockStore), permitindo cadastrar usuários e autenticá-los durante a sessão.

🏗️ Arquitetura
O projeto segue o padrão MVVM, com separação clara de responsabilidades:
lib/
├── main.dart
└── app/
    ├── app_widget.dart              # Widget raiz / configuração do MaterialApp
    ├── data/
    │   └── usuario_mock_store.dart  # Armazenamento em memória (singleton)
    ├── feature/
    │   └── auth/
    │       ├── model/
    │       │   └── user_model.dart          # Modelo de dados do usuário
    │       ├── view/
    │       │   ├── splash_page.dart         # Tela de splash
    │       │   ├── login_page.dart          # Tela de login
    │       │   ├── register_page.dart       # Tela de cadastro
    │       │   └── home_page.dart           # Tela inicial pós-login
    │       └── viewmodel/
    │           ├── splash_viewmodel.dart    # Lógica da splash
    │           ├── login_viewmodel.dart     # Lógica de autenticação
    │           ├── register_viewmodel.dart  # Lógica de cadastro
    │           └── home_viewmodel.dart      # Lógica da home
    └── routes/
        ├── app_routes.dart   # Constantes de rotas
        └── app_pages.dart    # Mapeamento de rotas

🖥️ Telas
Splash

Exibida por 3 segundos ao iniciar o app
Navega automaticamente para a tela de Login

Login

Campos de e-mail e senha com validação
Botão para alternar visibilidade da senha
Feedback de erro via SnackBar em caso de credenciais inválidas
Link de navegação para a tela de Cadastro
Indicador de carregamento (CircularProgressIndicator) durante a autenticação

Cadastro

Campos de nome, e-mail e senha com validação
Botão para alternar visibilidade da senha
Confirmação de sucesso via SnackBar
Redireciona para Login após cadastro realizado

Home

Exibe mensagem de boas-vindas com o nome do usuário logado
Botão de logout (retorna para a tela de Login)


✅ Funcionalidades

 Splash screen com delay de 3 segundos
 Formulário de login com validação de campos
 Formulário de cadastro com validação de campos
 Alternância de visibilidade da senha
 Feedback visual de erro/sucesso com SnackBar
 Indicador de carregamento simulado (Future.delayed)
 Armazenamento em memória via singleton (UsuarioMockStore)
 Navegação entre telas com rotas nomeadas
 Arquitetura MVVM com ChangeNotifier


⚠️ Pontos de Atenção no Código
home_page.dart — Parâmetro nomeUsuario vazio na rota
Em app_pages.dart, a rota /home instancia HomePage com nomeUsuario: '':
dartAppRoutes.home: (_) => const HomePage(nomeUsuario: ''),
O correto seria passar o nome do usuário retornado pelo login. Uma solução simples é usar Navigator.pushReplacementNamed com arguments:
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
automaticallyImplyLeading — Propriedade errada
Em home_page.dart, o AppBar usa automaticallyImplyActions (que não existe). O correto é:
dartautomaticallyImplyLeading: false,
Arquivos duplicados / legado
O projeto contém duas estruturas paralelas:

lib/app/views/ + lib/app/viewmodels/ — versão inicial/legada
lib/app/feature/auth/ — versão atual com MVVM correto

Os arquivos em lib/app/views/ e lib/app/viewmodels/ não são utilizados pelo app_widget.dart e podem ser removidos para evitar confusão.
UsuarioMockStore — instância direta vs. singleton
Em lib/app/viewmodels/login_viewmodel.dart (versão legada), o store é instanciado diretamente com UsuarioMockStore(), o que cria uma instância separada e não compartilha dados com o singleton UsuarioMockStore.instance usado nas ViewModels corretas.

🚀 Como Executar
Pré-requisitos

Flutter SDK (>= 3.18.0)
Dart SDK >= 3.11.0
Android Studio / VS Code com extensões Flutter e Dart

Passos
bash# 1. Clone o repositório
git clone <url-do-repositorio>
cd flutter_application_1

# 2. Instale as dependências
flutter pub get

# 3. Execute o aplicativo
flutter run

📦 Dependências
PacoteVersãoUsoflutterSDKFramework principalvalidatorless^1.2.5Utilitários de validação de formuláriosflutter_lints^6.0.0Regras de lint recomendadas

🔧 Tecnologias Utilizadas

Flutter — Framework UI multiplataforma
Dart — Linguagem de programação
MVVM — Padrão de arquitetura
ChangeNotifier — Gerenciamento de estado reativo
Named Routes — Navegação por rotas nomeadas
