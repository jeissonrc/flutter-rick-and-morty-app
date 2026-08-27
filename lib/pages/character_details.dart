import 'package:flutter/material.dart';
import 'package:projeto_tde_aula10/models/characters.dart';
import 'package:projeto_tde_aula10/models/planets.dart';
import 'package:projeto_tde_aula10/pages/planet_details.dart';
import 'package:projeto_tde_aula10/services/planet_service.dart';

class CharacterDetails extends StatefulWidget {
  final Character character;

  const CharacterDetails({super.key, required this.character});

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  bool traduzir = false;

  // Traduções
  String traduzStatus(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return 'Vivo';
      case 'dead':
        return 'Morto';
      default:
        return 'Desconhecido';
    }
  }

  String traduzGenero(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'Masculino';
      case 'female':
        return 'Feminino';
      case 'genderless':
        return 'Sem gênero';
      default:
        return 'Desconhecido';
    }
  }

  String traduzEspecie(String species) {
    switch (species.toLowerCase()) {
      case 'human':
        return 'Humano';
      case 'alien':
        return 'Alienígena';
      case 'robot':
        return 'Robô';
      case 'animal':
        return 'Animal';
      case 'mythological creature':
        return 'Criatura Mitológica';
      case 'humanoid':
        return 'Humanoide';
      case 'unknown':
        return 'Desconhecida';
      default:
        return species; // Retorna original se não conhece
    }
  }

  String traduzirOrigemOuLocalizacao(String valor) {
    if (valor.toLowerCase() == 'unknown' || valor.toLowerCase() == 'desconhecido') {
      return 'Desconhecido';
    }
    return valor;
  }

  Future<void> _abrirOrigem() async {
    final url = widget.character.originUrl;
    if (url.isEmpty) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      PlanetService service = PlanetService();
      Planet planeta = await service.getPlanet(url);

      Navigator.pop(context); // fecha loading
      //Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterDetails(character: _personagensFiltrados[index]) ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PlanetDetails(planet: planeta)),
      );
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao carregar dados da origem")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final character = widget.character;

    final status = traduzir ? traduzStatus(character.status) : character.status;
    final genero = traduzir ? traduzGenero(character.gender) : character.gender;
    final especie = traduzir ? traduzEspecie(character.species) : character.species;

    final origem = traduzir
        ? traduzirOrigemOuLocalizacao(character.originName)
        : character.originName;

    final localizacao = traduzir
        ? traduzirOrigemOuLocalizacao(character.locationName)
        : character.locationName;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            tooltip: 'Traduzir',
            onPressed: () {
              setState(() {
                traduzir = !traduzir;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    character.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfo("Nome", character.name),
                _buildInfo("Status", status),
                _buildInfo("Espécie", especie),
                _buildInfo("Gênero", genero),
                _buildOrigem("Origem", origem, character.originUrl),
                _buildInfo("Localização", localizacao),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildOrigem(String label, String value, String url) {
    final isClickable = url.isNotEmpty && value != 'Desconhecido';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: isClickable ? _abrirOrigem : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: isClickable ? Colors.blue : Colors.black,
                  decoration: isClickable ? TextDecoration.underline : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
