import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _textEditingController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusColor: Colors.grey,
          fillColor: Colors.grey,
          suffixIcon: IconButton(
            onPressed: () {
              print(_textEditingController.text);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          hintText: 'Rechercher...',
          /*hintStyle: TextStyle(
            color: Colors.white,
          ),*/
        ),
        onSubmitted: (value) => print(value),
      ),
    );
  }
}
