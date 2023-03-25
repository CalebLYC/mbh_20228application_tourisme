import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mbh/composants/head.dart';
import 'package:mbh/composants/hotel_location.dart';
import 'package:mbh/composants/populars.dart';
import 'package:mbh/composants/title.dart';
import 'package:mbh/models/Hotel.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key, required this.hotel});
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadWidget(hotel: hotel, size: size),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(hotel.ville),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star_border_outlined,
                              color: Colors.orange,
                            )),
                        Text(hotel.stars!.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  hotel.description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  hotel.telephone,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const TitleWidget(title: 'Localisation'),
              Container(
                width: size.width,
                height: size.height / 3,
                /*child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/hotels/map.jpeg',
                    width: size.width - 20,
                    fit: BoxFit.cover,
                  ),*/
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: HotelLocationCarte(
                    center: LatLng(hotel.latitude!, hotel.longitude!),
                    hotel: hotel,
                  ),
                ),
              ),
              PopularsHotels(),
            ],
          ),
        ),
      ),
    );
  }
}
