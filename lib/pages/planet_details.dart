import 'package:flutter/material.dart';
import 'package:projeto_tde_aula10/models/planets.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;

  const PlanetDetails({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfo("Nome", planet.name),
                _buildInfo("Tipo", planet.type),
                _buildInfo("Dimensão", planet.dimension),
                _buildInfo("Quantidade de moradores", planet.residentsCount.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
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
}
