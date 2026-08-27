class Planet {
  final String name;
  final String type;
  final String dimension;
  final int residentsCount;

  Planet({
    required this.name,
    required this.type,
    required this.dimension,
    required this.residentsCount,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json["name"],
      type: json["type"],
      dimension: json["dimension"],
      residentsCount: (json["residents"] as List).length,
    );
  }
}
