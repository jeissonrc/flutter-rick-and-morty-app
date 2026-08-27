Flutter Rick and Morty App

<p align="center">
  <strong>A Flutter mobile application integrating Firebase Authentication and the Rick and Morty API.</strong>
</p>

<p align="center">
  Academic project developed during the <strong>Mobile Systems Development (DSM)</strong> course at ULBRA.
</p>

<p align="center">
  🇧🇷 <a href="README.pt-BR.md">Versão em Português</a>
</p>

📱 About the Project

This project was developed as part of the Mobile Systems Development (DSM) course at ULBRA.

The original objective was to practice mobile application development concepts. The project was expanded to explore integration with an external REST API, authentication, filtering, navigation and related data.

The application combines:

Flutter / Dart for the mobile interface

Firebase Authentication for user registration and login

Rick and Morty API for character and location data

✨ Features

🔐 User registration and login

🔥 Firebase Authentication

👽 Character listing

🔎 Character filtering/search

📄 Character details

🌌 Related location/dimension details

🔗 Navigation between related resources

🌐 REST API consumption

📚 API pagination handling

🛠️ Technologies

Technology

Usage

Flutter

Mobile application framework

Dart

Application development

Firebase Authentication

User authentication

HTTP

API requests

Rick and Morty API

Character and location data

Android Studio

Development environment

🧩 Project Structure

lib/
├── models/
│   ├── characters.dart
│   ├── planets.dart
│   └── users.dart
│
├── pages/
│   ├── login_page.dart
│   ├── cadastre_se_page.dart
│   ├── characters_list.dart
│   ├── character_details.dart
│   └── planet_details.dart
│
├── services/
│   ├── character_service.dart
│   ├── planet_service.dart
│   └── firebase/
│       └── auth/
│           └── firebase_auth_service.dart
│
├── constants.dart
└── main.dart

🔌 API Integration

The application consumes the public Rick and Morty API:

https://rickandmortyapi.com/

Character data is loaded from the API, filtered in the application and presented through dedicated detail screens.

The project also explores related resources, allowing the user to navigate from a character to information about the location associated with that character.

🔐 Authentication

Firebase Authentication is used to manage the application access flow.

The project includes:

User registration

User login

Authentication validation

Access to the application

Logout

📚 Academic Context

This project was developed during the Mobile Systems Development (DSM) course at ULBRA, applying concepts discussed throughout the course.

One of the interesting parts of the project was going beyond a basic API consumption example and exploring relationships between the returned data, including character details and their associated locations.

Special thanks to Professor Daniel Souza for the concepts and guidance provided during the course.

🎯 What This Project Demonstrates

This project represents practical experience with:

Mobile application development

Flutter and Dart

Authentication flows

REST API consumption

JSON data handling

API pagination

Data modeling

Filtering

Screen navigation

Integration with external services

⚠️ Project Status

This is an academic project developed for learning purposes.

The repository preserves the version developed during the course and is intended primarily as a portfolio and study reference.

👤 Author

Jeisson Rocha da Cunha

GitHub: https://github.com/jeissonrc

Repository: https://github.com/jeissonrc/flutter-rick-and-morty-app

🇧🇷 Português

See the Portuguese version.
