class Hotel {
  final int? id;
  final String name;
  final String description;
  final String ville;
  final String? horaire;
  final String? adresse;
  final String? email;
  final double? longitude;
  final double? latitude;
  final int? stars;
  final String image;
  final String telephone;

  const Hotel({
    this.id,
    required this.name,
    required this.description,
    required this.ville,
    this.horaire,
    this.adresse,
    this.email,
    this.stars,
    this.longitude,
    this.latitude,
    this.image = 'images/chambre.jpg',
    this.telephone = '+228 91982996',
  });

  factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        ville: json['ville'],
        horaire: json['horaire'],
        email: json['email'],
        adresse: json['adresse'],
        stars: double.parse(json['stars']).round(),
        image: json['image'],
        longitude: double.parse(json['longitude']),
        latitude: double.parse(json['latitude']),
        telephone: json['telephone'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ville': ville,
      'horaire': horaire,
      'email': email,
      'addresse': adresse,
      'stars': stars,
      'image': image,
      'longitude': longitude,
      'latitude': latitude,
      'telephone': telephone,
    };
  }
}
