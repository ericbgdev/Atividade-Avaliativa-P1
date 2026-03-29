# Atividade Avaliativa P1 - Projeto Flutter - Professor Marcelo Ciacco

👥 Integrantes do Grupo
Eric Butzloff Gudera RA: 25001129
.
Ícaro Cauã Guminiak de Godoy RA: 25000026

Este projeto consiste no desenvolvimento de um aplicativo Flutter focado em navegação, formulários, validação e organização arquitetural
. O objetivo é demonstrar o domínio de conceitos como separação de responsabilidades e manipulação de dados em memória
.
#### Fluxo do Aplicativo
O aplicativo segue rigorosamente o fluxo de navegação exigido
:
Splash Screen: Tela inicial com identidade visual e timer de 3 segundos
.
Login: Tela de autenticação que consulta a base de dados mockada
.
Cadastro: Tela para registro de novos usuários, armazenando-os em uma lista em memória
.
Home: Tela de destino após login bem-sucedido, contendo ícone e texto centralizados
.
#### Arquitetura Adotada
O projeto utiliza a arquitetura MVVM (Model-View-ViewModel) para garantir a separação de responsabilidades
:
Model: Define a estrutura de dados do usuário (UsuarioModel)
.
ViewModel: Camada responsável pela lógica de negócio e intermediação entre a View e os dados (Ex: lógica de autenticação e timers)
.
View: Camada de interface que contém apenas os widgets e a lógica de validação visual de formulários
.
Data/Store: Camada que gerencia a persistência dos dados em memória durante a execução do app
.
#### Tecnologias e Requisitos Técnicos
Navegação por Rotas: Implementada no MaterialApp para facilitar a transição entre telas
.
Dados Mockados: Uso de uma List<UsuarioModel> gerenciada pelo padrão Singleton, garantindo que os usuários cadastrados estejam acessíveis na tela de login
.
Validação de Formulários: Uso de TextFormField com GlobalKey<FormState> para garantir que os campos obrigatórios sejam preenchidos corretamente
.
Feedback ao Usuário: Implementação de SnackBar para mensagens de erro em login inválido e sucesso no cadastro (Diferenciais)
.
--------------------------------------------------------------------------------
