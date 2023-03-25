import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbh/composants/hotel_card.dart';
import 'package:mbh/models/Hotel.dart';
import 'package:mbh/utils/data.dart';
import 'package:http/http.dart' as http;

class HotelsList extends StatefulWidget {
  const HotelsList({super.key, this.hotelsList = hotels});
  final List<Hotel> hotelsList;

  @override
  State<HotelsList> createState() => _HotelsListState(hotelsList);
}

class _HotelsListState extends State<HotelsList> {
  var hotelsList;
  _HotelsListState(this.hotelsList);

  @override
  void initState() {
    super.initState();
    _fetchHotelsList();
  }

  Future<void> _fetchHotelsList() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/hotels'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;

      setState(() {
        hotelsList = jsonList.map((json) => Hotel.fromMap(json)).toList();
      });
    } else {
      throw Exception('Failed to fetch hotels list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.75,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: ListView.builder(
        itemCount: hotelsList.length,
        itemBuilder: (context, index) => HotelCard(hotel: hotelsList[index]),
      ),
    );
  }
}
