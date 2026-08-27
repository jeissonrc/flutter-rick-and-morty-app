import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:projeto_tde_aula10/constants.dart';
import 'package:projeto_tde_aula10/models/characters.dart';

class CharacterService {
  Future<List<Character>> getCharacters() async {
    List<Character> allCharacters = []; // Lista onde vou colocar todos os characters
    String? url = '$BASE_URL/character'; // De início pega a primeira página

    while (url != null) {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Descodifica o JSON da resposta

        List results = data['results']; // Pega os personagens da resposta
        allCharacters.addAll(results.map((e) => Character.fromJson(e)).toList()); //aqui converte cada item JSON em um objeto e adciona na lista final

        url = data['info']['next']; // Atualiza a URL para a próxima página (vem em "info.next"), Se não houver mais páginas, "next" será null e o loop acaba.

      }else{

        throw Exception("Erro ao buscar os personagens da API");

      }
    }

    return allCharacters;
  }
}
