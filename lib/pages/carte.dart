import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mbh/utils/data.dart';
import '../src/locations.dart' as locations;

class CartePage extends StatefulWidget {
  const CartePage({super.key});

  @override
  State<CartePage> createState() => _CartePageState();
}

class _CartePageState extends State<CartePage> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final hotel in hotels) {
        final marker = Marker(
          markerId: MarkerId(hotel.name),
          position: LatLng(hotel.latitude!, hotel.longitude!),
          infoWindow: InfoWindow(
            title: hotel.name,
            snippet: hotel.name,
          ),
        );
        _markers[hotel.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: LatLng(6.9000, 0.6333),
        zoom: 10,
      ),
      markers: _markers.values.toSet(),
    );
  }
}
