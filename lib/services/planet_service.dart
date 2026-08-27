import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_tde_aula10/models/planets.dart';

class PlanetService {
  Future<Planet> getPlanet(String url) async {
    //url = "";
    if (url.isEmpty) {
      throw Exception("URL do planeta vazia");
    }
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return Planet.fromJson(jsonResponse);
    } else {
      throw Exception("Erro ao buscar dados do planeta");
    }
  }
}