class Category {
  final int? id;
  final int hotel_id;
  final String maps;
  final String ville;

  const Category({
    this.id,
    required this.hotel_id,
    required this.maps,
    required this.ville,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json['id'],
        hotel_id: json['hotel_id'],
        maps: json['maps'],
        ville: json['ville'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hotel_id': hotel_id,
      'maps': maps,
      'ville': ville,
    };
  }
}
