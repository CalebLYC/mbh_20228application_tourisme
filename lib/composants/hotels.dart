import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mbh/composants/hotels_list.dart';
import 'package:mbh/composants/populars.dart';
import 'package:mbh/composants/title.dart';
import 'package:mbh/utils/data.dart';

class Hotels extends StatefulWidget {
  const Hotels({super.key});

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(title: 'Hotels populaires'),
        const PopularsHotels(),
        HotelsList(hotelsList: hotels),
      ],
    );
  }
}
