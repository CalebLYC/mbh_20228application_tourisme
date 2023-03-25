import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mbh/models/Hotel.dart';

class HotelLocationCarte extends StatefulWidget {
  HotelLocationCarte(
      {super.key, this.center = const LatLng(1.32, 1.25), required this.hotel});
  LatLng center;
  final Hotel hotel;

  @override
  State<HotelLocationCarte> createState() =>
      _HotelLocationCarteState(center: center, hotel: hotel);
}

class _HotelLocationCarteState extends State<HotelLocationCarte> {
  late GoogleMapController mapController;
  _HotelLocationCarteState(
      {this.center = const LatLng(6.9000, 0.6333), required this.hotel});

  final Map<String, Marker> _markers = {};

  final LatLng center;
  final Hotel hotel;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId(hotel.name),
        position: LatLng(hotel.latitude!, hotel.longitude!),
        infoWindow: InfoWindow(
          title: hotel.name,
          snippet: hotel.name,
        ),
      );
      _markers[hotel.name] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 11.0,
      ),
      markers: _markers.values.toSet(),
    );
  }
}
