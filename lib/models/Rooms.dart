import 'dart:ffi';

class Room {
  final int? id;
  final String image;
  final String? name;
  final double price;
  final double? floor;
  final bool? isAvailable;
  final int? hotelId;
  final String? description;

  const Room({
    this.id,
    this.image = 'images/chambre.jpg',
    this.name,
    required this.price,
    this.floor,
    this.isAvailable,
    this.hotelId,
    this.description,
  });

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        id: json['id'],
        image: json['image'],
        price: json['price'],
        name: json['name'],
        floor: json['floor'],
        isAvailable: json['isAvailable'],
        hotelId: json['hotelId'],
        description: json['description'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'floor': floor,
      'isAvailable': isAvailable,
      'hotelId': hotelId,
      'description': description,
    };
  }
}
