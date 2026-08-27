import 'package:flutter/material.dart';
import 'package:projeto_tde_aula10/services/firebase_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cadastrese extends StatefulWidget {
  @override
  State<Cadastrese> createState() => _Cadastrese();
}

class _Cadastrese extends State<Cadastrese> {
  final firebaseUtil = FirebaseUtil();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

  Future<void> _register() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showSnackBar("Por favor, preencha todos os campos.");
      return;
    }

    if (!_isEmailValid(email)) {
      _showSnackBar("Formato de e-mail inválido.");
      return;
    }

    if (password.length < 6) {
      _showSnackBar("A senha deve ter pelo menos 6 caracteres.");
      return;
    }

    try {
      await firebaseUtil.register(email, password /*, name se quiser usar*/);
      _showSnackBar("Cadastro realizado com sucesso.\nBem Vindo $name!", color: Colors.green);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showSnackBar("Este e-mail já está em uso.");
      } else if (e.code == 'invalid-email') {
        _showSnackBar("E-mail inválido.");
      } else if (e.code == 'weak-password') {
        _showSnackBar("Senha muito fraca. Use pelo menos 6 caracteres.");
      } else {
        _showSnackBar("Erro: ${e.message}");
      }
    } catch (e) {
      _showSnackBar("Erro inesperado. Tente novamente.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastre-se"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_add_alt_1_outlined, size: 72, color: Colors.grey[700]),
              const SizedBox(height: 24),

              // Nome
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Email
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

              // Senha com olho
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

              // Botão de cadastro
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  child: Text('Cadastre-se'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
