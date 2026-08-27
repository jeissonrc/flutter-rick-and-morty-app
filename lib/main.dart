import 'dart:ffi';

import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_tde_aula10/models/users.dart';
import 'package:projeto_tde_aula10/pages/characters_list.dart';
import 'package:projeto_tde_aula10/services/firebase/auth/firebase_auth_service.dart';

import 'package:projeto_tde_aula10/pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;
  //var user = auth.signInWithEmailAndPassword(email: "jeissonrc@rede.ulbra.br", password: "12345678");
  //debugPrint(user.toString());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: initializeApp(),
    );
  }
}

class initializeApp extends StatelessWidget {
  final FireBaseAuthService _auth = FireBaseAuthService();
  initializeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
        stream: _auth.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasData && snapshot.data!.email.isNotEmpty){
              return const CharactersListPage();
          }

          return LoginPage();

        },
    );
  }
}

