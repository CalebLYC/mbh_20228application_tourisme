import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mbh/composants/searchbar.dart';
import 'package:badges/badges.dart';

class MainHead extends StatefulWidget {
  const MainHead({super.key});

  @override
  State<MainHead> createState() => _MainHeadState();
}

class _MainHeadState extends State<MainHead> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 10, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.login,
                color: Colors.grey,
                size: 30,
              ),
            ),
            const SearchBar(),
            IconButton(
              onPressed: () {},
              icon: Badge(
                badgeStyle: const BadgeStyle(
                  badgeColor: Colors.red,
                ),
                badgeContent: Text(
                  5.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
