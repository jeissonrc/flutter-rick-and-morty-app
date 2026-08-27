import 'package:flutter/material.dart';
import 'package:projeto_tde_aula10/pages/cadastre_se_page.dart';
import 'package:projeto_tde_aula10/services/firebase/auth/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FireBaseAuthService _auth = FireBaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _showSnackBar(String message, {Color color = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            message,
            textAlign: TextAlign.center,
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  bool _isEmailValid(String email) {
    final regex = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");
    return regex.hasMatch(email);
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("Por favor, preencha todos os campos.");
      return;
    }

    if (!_isEmailValid(email)) {
      _showSnackBar("Formato de e-mail inválido.");
      return;
    }

    try {
      final userCredential = await _auth.signIn(email, password);

      if (userCredential.user != null) {
        _showSnackBar("Login realizado com sucesso.\n Seja Bem Vindo!", color: Colors.green);
        // Aqui eu poderia redirecionar direto, mas o sistema ja faz na main
        // caso precisar, usar o Navigator.pushReplacement(...);
      } else {
        _showSnackBar("Falha ao realizar o login.");
      }

    } on FirebaseAuthException catch (e) {
      // Erros que indicam falha de login (Firebase pode mudar os nomes)
      final authErrorCodes = [
        'user-not-found',
        'wrong-password',
        'invalid-email',
        'user-disabled',
        'invalid-credential',
        'account-exists-with-different-credential'
      ];

      if (authErrorCodes.contains(e.code)) {
        _showSnackBar("E-mail ou senha incorretos.");
      } else {
        debugPrint("Código de erro desconhecido: ${e.code}");
        _showSnackBar("Erro inesperado. Tente novamente.");
      }
    } catch (e) {
      _showSnackBar("Erro inesperado. Tente novamente.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock_outline, size: 72, color: Colors.grey[700]),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  child: const Text("Entrar"),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastrese()),
                  );
                },
                child: const Text("Criar uma conta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
