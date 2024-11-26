// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class Alsuhcard extends StatelessWidget {
  String title;
  String subttile;
  Icon trailing;

  Alsuhcard({
    super.key,
    required this.title,
    required this.subttile,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subttile,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
      trailing: trailing,
    );
  }
}
