import 'package:flutter/material.dart';
import 'package:mbh/models/Hotel.dart';
import 'package:mbh/pages/hotel_details.dart';

class PopularHotelCard extends StatelessWidget {
  const PopularHotelCard({super.key, required this.hotel});
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                hotel.image,
                width: 260,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      hotel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 21,
                        color: Colors.blue[900],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            hotel.ville,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < hotel.stars!; i++)
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                          for (int i = 0; i < hotel.stars!; i++)
                            const Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
