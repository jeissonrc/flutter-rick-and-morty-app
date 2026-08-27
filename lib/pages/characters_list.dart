import 'package:flutter/material.dart';
import 'package:projeto_tde_aula10/models/characters.dart';
import 'package:projeto_tde_aula10/pages/character_details.dart';
import 'package:projeto_tde_aula10/services/character_service.dart';
import 'package:projeto_tde_aula10/services/firebase/auth/firebase_auth_service.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  final FireBaseAuthService _auth = FireBaseAuthService();
  CharacterService service = CharacterService();

  late Future<List<Character>> _personagensFuture;
  late List<Character> _personagens;
  late List<Character> _personagensFiltrados;

  @override
  void initState() {
    super.initState();
    _personagensFuture = _getCharacters();
  }

  Future<List<Character>> _getCharacters() async {
    _personagens = await service.getCharacters();
    _personagensFiltrados = _personagens;
    return _personagens;
  }

  void _filtroPersonagens(String filtro) {
    setState(() {
      _personagensFiltrados = _personagens
          .where((item) => item.name.toLowerCase().contains(filtro.toLowerCase()))
          .toList();
    });
  }

  /// Função para mostrar mensegam de Logout
  void _showSnackBar(String message, {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Chamar a função e mostra a mensagem de Logout com Sucesso
  Future<void> _logout() async {
    await _auth.signOut();
    _showSnackBar("Logout efetuado com sucesso");
    // Se quiser redirecionar para a tela de login, descomente:
    // Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personagens"),
        backgroundColor: Colors.grey.shade200,
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) => _filtroPersonagens(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Filtro",
              ),
            ),
          ),
          FutureBuilder<List<Character>>(
            future: _personagensFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final personagem = _personagensFiltrados[index];
                        return ListTile(
                          title: Text(personagem.name),
                          leading: Image.network(personagem.image),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CharacterDetails(character: personagem),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: _personagensFiltrados.length,
                    ),
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Text("Ops, algo deu errado!");
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
