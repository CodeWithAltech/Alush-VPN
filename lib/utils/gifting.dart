// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alush/helpers/alerts.dart';
import 'package:alush/utils/textinput.dart';
import 'package:flutter/material.dart';

class GiftContainer extends StatelessWidget {
  const GiftContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text(
            'Your Gifts to Developer.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //TextField

          TextInput(
            hinText: '100 - more',
            Icons: Icon(
              Icons.monetization_on_outlined,
            ),
            maxLength: 1000,
          ),

          //Button
          GestureDetector(
            onTap: () {
              Alushlert.success(msg: 'Thanks for the gifts');
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.lightBlue,
                  )),
              child: Text(
                'Send',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
