import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tde_aula10/models/users.dart';

class FireBaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().map((user) {
        return UserModel(email: user?.email ?? "");
    });
  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('Erro do Firebase: ${e.code}');
      throw e; //  relança para que a tela saiba que deu erro
    } catch (e) {
      debugPrint('Erro Inesperado: $e');
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
  }


}