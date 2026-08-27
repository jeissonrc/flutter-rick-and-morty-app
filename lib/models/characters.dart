class Character{
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String originName;
  final String originUrl;
  final String locationName;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.originName,
    required this.originUrl,
    required this.locationName,
  });

  factory Character.fromJson(Map<String, dynamic> json){
    return Character(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      originName: json['origin']?['name'] ?? 'Desconhecido',   // <- ORIGIN É UM OBJETO!
      originUrl: json['origin']?['url'] ?? 'Desconhecido',   // <- ORIGIN É UM OBJETO!
      locationName: json['location']?['name'] ?? 'Desconhecido', // <- LOCATION TAMBÉM// Origin é um objeto na API, daí tem que pegar com dados aninhados
    );
  }
}