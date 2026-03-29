# Atividade Avaliativa P1 — Projeto Flutter

**Disciplina:** Desenvolvimento Mobile  
**Professor:** Marcelo Ciacco

---

## 👥 Integrantes

| Nome | RA |
|---|---|
| Eric Butzloff Gudera | 25001129 |
| Ícaro Cauã Guminiak de Godoy | 25000026 |

---

## 📋 Sobre o Projeto

Aplicativo Flutter desenvolvido como atividade avaliativa, com foco em navegação entre telas, formulários com validação, organização arquitetural e manipulação de dados em memória. O objetivo é demonstrar domínio dos conceitos de separação de responsabilidades, uso de modelos e autenticação simulada sem dependência de banco de dados ou APIs externas.

---

## 🔄 Fluxo do Aplicativo

```
Splash Screen (3s)
      ↓
   Login ←──────────────┐
      ↓                 │
  [Novo usuário?]   Cadastro
      ↓                 │
  Autenticação ─────────┘
      ↓
    Home
```

| Tela | Descrição |
|---|---|
| **Splash** | Tela inicial com identidade visual exibida por 3 segundos |
| **Login** | Autenticação consultando a lista de usuários em memória |
| **Cadastro** | Registro de novos usuários com validação de campos |
| **Home** | Destino após login bem-sucedido, com ícone e texto centralizados |

---

## 🏗️ Arquitetura

O projeto segue o padrão **MVVM (Model-View-ViewModel)**, garantindo separação clara de responsabilidades.

```
lib/
├── main.dart
└── app/
    ├── models/
    │   └── usuario_model.dart        # Estrutura de dados do usuário
    ├── data/
    │   └── usuario_mock_store.dart   # Singleton — lista em memória
    ├── viewmodels/
    │   ├── splash_viewmodel.dart     # Lógica do timer da splash
    │   ├── login_viewmodel.dart      # Lógica de autenticação
    │   └── signup_viewmodel.dart     # Lógica de cadastro
    └── views/
        ├── splash_page.dart
        ├── login_page.dart
        ├── signup_page.dart
        └── home_page.dart
```

### Responsabilidades por camada

- **Model** — define a estrutura de dados do usuário (`nome`, `login`, `senha`)
- **ViewModel** — contém toda a lógica de negócio (autenticação, timer, cadastro), sem acesso direto à interface
- **View** — responsável apenas pelos widgets e pela validação visual dos formulários
- **Data/Store** — gerencia a lista de usuários em memória via padrão Singleton

---

## ⚙️ Decisões Técnicas

### Compartilhamento de dados entre telas

Os usuários cadastrados são mantidos em uma única instância de `UsuarioMockStore` durante toda a execução do app, implementada com o padrão **Singleton**:

```dart
class UsuarioMockStore {
  static final UsuarioMockStore _instance = UsuarioMockStore._internal();
  factory UsuarioMockStore() => _instance;
  UsuarioMockStore._internal();

  final List<UsuarioModel> _usuarios = [];
}
```

A tela de cadastro chama `adicionar()` e a tela de login chama `buscar()` — ambas acessando a mesma lista.

### Navegação

Gerenciada por **rotas nomeadas** definidas no `MaterialApp`:

```dart
routes: {
  '/':        (context) => const SplashPage(),
  '/login':   (context) => const LoginPage(),
  '/cadastro':(context) => const SignupPage(),
  '/home':    (context) => const HomePage(),
}
```

### Validação de formulários

Utiliza `GlobalKey<FormState>` com `TextFormField` e `validator` em todos os campos obrigatórios, garantindo que nenhum dado inválido seja submetido.

---

## ✅ Requisitos Atendidos

- [x] Tela Splash com layout visual e navegação automática
- [x] Tela de Login com validação e autenticação simulada
- [x] Tela de Cadastro com validação de campos
- [x] Tela Home com ícone e texto centralizados
- [x] `UsuarioModel` representando os dados do usuário
- [x] `List<UsuarioModel>` como armazenamento em memória
- [x] Padrão Singleton para compartilhamento de dados entre telas
- [x] Arquitetura MVVM com separação de responsabilidades
- [x] Navegação por rotas nomeadas
- [x] SnackBar de erro no login inválido *(diferencial)*
- [x] SnackBar de sucesso no cadastro *(diferencial)*
