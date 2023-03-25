import 'package:flutter/material.dart';
import 'package:mbh/composants/favorite_card.dart';
import 'package:mbh/models/Hotel.dart';

class FavoritesHotelsList extends StatelessWidget {
  const FavoritesHotelsList({super.key, required this.hotels});
  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.75,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) =>
            FavoriteHotelCard(hotel: hotels[index]),
      ),
    );
  }
}
