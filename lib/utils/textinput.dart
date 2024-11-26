// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hinText;
  final Icon Icons;
  final int maxLength;
  const TextInput(
      {super.key,
      required this.hinText,
      required this.Icons,
      required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hinText,
          prefixIcon: Icons,
          prefixIconColor: Colors.lightBlueAccent,
          hintStyle: TextStyle(
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
