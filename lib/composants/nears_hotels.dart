import 'dart:convert';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mbh/composants/hotels_list.dart';
import 'package:mbh/models/Hotel.dart';
import 'package:mbh/utils/data.dart';
import 'package:http/http.dart' as http;

class NearsHotels extends StatefulWidget {
  NearsHotels({super.key});

  State<NearsHotels> createState() => _NearsHotels();
}

class _NearsHotels extends State<NearsHotels> {
  List<Hotel> hotels = nearsHotels;

  @override
  void initState() {
    super.initState();
    _fetchhotels();
  }

  Future<void> _fetchhotels() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/hotels'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;

      setState(() {
        hotels = jsonList
            .map((json) => Hotel.fromMap(json))
            .where((hotel) => hotel.ville.toLowerCase() == 'lome')
            .toList();
      });
    } else {
      throw Exception('Failed to fetch hotels list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return HotelsList(hotelsList: hotels);
  }
}
