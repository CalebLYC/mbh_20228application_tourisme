import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mbh/models/Hotel.dart';
import 'package:mbh/pages/hotel_details.dart';
import 'package:mbh/utils/data.dart';

class FavoriteHotelCard extends StatefulWidget {
  const FavoriteHotelCard({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<FavoriteHotelCard> createState() => _FavoriteHotelCard(hotel: hotel);
}

class _FavoriteHotelCard extends State<FavoriteHotelCard> {
  final Hotel hotel;
  _FavoriteHotelCard({required this.hotel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => HotelDetailsPage(
                hotel: hotel,
              ),
            ),
          );
        }),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: 'page1-hotel-${hotel.id!}',
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    hotel.image,
                    width: 153.0,
                    height: 153.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: Colors.blue[900],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              hotel.ville,
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                fontStyle: FontStyle.italic,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < hotel.stars!; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              ),
                            for (int i = 0; i < 5 - hotel.stars!; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 18,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                favoritesHotels.remove(hotel);
                              });
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text('Retirer des\n  favoris')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
