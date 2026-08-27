# Flutter Rick and Morty App

<p align="center">
  <strong>Aplicação mobile desenvolvida em Flutter com autenticação Firebase e integração com a Rick and Morty API.</strong>
</p>

<p align="center">
  Projeto acadêmico desenvolvido durante a disciplina de <strong>Desenvolvimento de Sistemas Móveis (DSM)</strong> na ULBRA.
</p>

<p align="center">
  🇺🇸 <a href="README.md">English Version</a>
</p>

---

## 🚀 Destaques

- 📱 Aplicação mobile desenvolvida com Flutter
- 🔐 Autenticação com Firebase
- 🌐 Integração com API REST
- 👽 Exploração de personagens de Rick and Morty
- 🔎 Busca e filtragem de personagens
- 📄 Detalhes dos personagens
- 🌌 Navegação para localizações/dimensões relacionadas
- 📚 Tratamento de paginação da API

---

## 📱 Sobre o Projeto

Este projeto foi desenvolvido durante a disciplina de **Desenvolvimento de Sistemas Móveis (DSM)** da ULBRA.

A proposta inicial era aplicar conceitos de desenvolvimento de aplicações mobile utilizando Flutter. Durante o desenvolvimento, o projeto foi ampliado para explorar integração com uma API REST externa, autenticação, filtros, navegação e relacionamento entre dados.

A aplicação combina **Flutter e Dart** com **Firebase Authentication** e a API pública **Rick and Morty API**.

O projeto vai além de uma simples listagem de dados, permitindo explorar personagens, acessar seus detalhes e navegar para informações relacionadas às localizações associadas a eles.

---

## ✨ Funcionalidades

### Autenticação

- Cadastro de usuários
- Login de usuários
- Validação de autenticação
- Logout
- Integração com Firebase Authentication

### Personagens

- Listagem de personagens
- Busca e filtragem
- Detalhes dos personagens
- Tratamento de paginação da API

### Localizações / Dimensões

- Acesso à localização associada ao personagem
- Consulta dos detalhes da localização
- Navegação entre recursos relacionados

---

## 🛠️ Tecnologias

### Core

- Flutter
- Dart

### Autenticação

- Firebase Authentication

### API e Dados

- HTTP
- REST API
- JSON
- Rick and Morty API

### Desenvolvimento

- Android Studio
- Git
- GitHub

---

## 🧩 Estrutura do Projeto

O código principal da aplicação está organizado em três áreas:

```text
lib/
├── models/       # Modelos de dados
├── pages/        # Telas da aplicação
├── services/     # Serviços de API e autenticação
├── constants.dart
└── main.dart     # Ponto de entrada da aplicação
```

### Principais responsabilidades

**models/**  
Contém as estruturas de dados utilizadas pela aplicação.

**pages/**  
Contém as telas e a interface do usuário.

**services/**  
Contém a lógica responsável pela comunicação com APIs externas e autenticação.

Essa organização mantém o projeto mais fácil de compreender, manter e evoluir.

---

## 🔌 Integração com a API

A aplicação utiliza a API pública **Rick and Morty API**:

https://rickandmortyapi.com/

A API é utilizada para obter informações de personagens e localizações.

A aplicação oferece:

- listagem de personagens;
- busca e filtragem;
- detalhes dos personagens;
- navegação para localizações relacionadas;
- carregamento de múltiplas páginas da API.

O projeto também explora os relacionamentos entre os recursos retornados pela API, permitindo que informações de um personagem direcionem o usuário para dados relacionados à sua localização.

---

## 🔐 Autenticação

O **Firebase Authentication** é utilizado para controlar o fluxo de autenticação da aplicação.

O projeto contempla:

1. Cadastro de usuário
2. Login
3. Validação da autenticação
4. Acesso à aplicação
5. Logout

---

## 📚 Contexto Acadêmico

Este projeto foi desenvolvido durante a disciplina de **Desenvolvimento de Sistemas Móveis (DSM)** da **ULBRA**.

O objetivo foi aplicar conceitos relacionados ao desenvolvimento de aplicações mobile, consumo de APIs e integração com serviços externos.

Durante o desenvolvimento, o projeto foi ampliado para explorar funcionalidades adicionais, como filtros de personagens, navegação entre recursos relacionados e tratamento da paginação da API.

Agradecimento ao **Professor Daniel Souza** pelos conceitos e orientações trabalhados ao longo da disciplina.

---

## 🎯 O que este Projeto Demonstra

Este projeto reúne experiência prática em:

- Desenvolvimento de aplicações mobile
- Flutter e Dart
- Firebase Authentication
- Consumo de APIs REST
- Manipulação de dados JSON
- Paginação de APIs
- Modelagem de dados
- Filtros e consultas
- Navegação entre telas
- Integração com serviços externos

---

## 📌 Status do Projeto

Este é um **projeto acadêmico**, desenvolvido com finalidade de aprendizado.

O repositório preserva a versão desenvolvida durante a disciplina e tem como objetivo servir como portfólio e referência de estudos.

---

## 👤 Autor

**Jeisson Rocha da Cunha**

GitHub:  
https://github.com/jeissonrc

Repositório:  
https://github.com/jeissonrc/flutter-rick-and-morty-app

---

## 🇺🇸 English

A versão em inglês desta documentação está disponível em:

[README.md](README.md)
