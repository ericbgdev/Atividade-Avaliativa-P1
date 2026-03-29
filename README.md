# App Login-Cadastro MVVM — Flutter

Aplicativo Flutter desenvolvido como atividade avaliativa P1 da disciplina Desenvolvimento Mobile. Implementa um fluxo completo de autenticação (login e cadastro) utilizando o padrão de arquitetura MVVM com gerenciamento de estado via `ChangeNotifier`.
---

## 👥 Integrantes
* **Eric Butzloff Gudera** — RA: 25001129
* **Ícaro Cauã Guminiak de Godoy** — RA: 25000026
* **Professor:** Marcelo Ciacco
* **Disciplina:** Desenvolvimento Mobile

---

## 📋 Sobre o Projeto
Este é um aplicativo Flutter que demonstra boas práticas de desenvolvimento mobile, com foco em arquitetura limpa e separação de responsabilidades. O app implementa um sistema completo de autenticação (login e cadastro) com persistência de dados em memória através de um *mock store*.

**Principais características:**
* Fluxo de autenticação completo (splash → login → cadastro → home)
* Validação de formulários com feedback visual
* Indicadores de carregamento durante operações
* Alternância de visibilidade de senha
* Mensagens de erro e sucesso via `SnackBar`
* Padrão MVVM com `ChangeNotifier` para reatividade

---

## 🏗️ Arquitetura MVVM
O projeto segue o padrão MVVM (Model-View-ViewModel) com separação clara de responsabilidades:

```text
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
