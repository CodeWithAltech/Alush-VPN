// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alush/helpers/alerts.dart';
import 'package:alush/utils/gifting.dart';
import 'package:alush/utils/textinput.dart';
import 'package:flutter/material.dart';

class RegisterAuth extends StatelessWidget {
  const RegisterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Title
          SizedBox(
            height: 10,
          ),
          Text(
            'Alush KYC',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.lock_person,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          //Register to get Free Bonuses.
          Text(
            'Register to get Free Bonuses',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Ui
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue.withOpacity(.9),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                //UserName
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Alush Username',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextInput(
                      hinText: 'Alush01',
                      Icons: Icon(
                        Icons.person_3_outlined,
                      ),
                      maxLength: 10,
                    ),
                  ],
                ),

                //PhoneNumber
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'PhoneNuber',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextInput(
                      hinText: '+256-70xxxxxxx',
                      Icons: Icon(
                        Icons.phone_in_talk_sharp,
                      ),
                      maxLength: 12,
                    ),
                  ],
                ),

                //Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Alush Email',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextInput(
                      hinText: 'alush@info.com',
                      Icons: Icon(
                        Icons.mark_email_read_outlined,
                      ),
                      maxLength: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Regsiter Button
          GestureDetector(
            onTap: () {
              Alushlert.success(msg: 'Now Registered. 1000 alus added.');
              Navigator.pop(context);
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
                'Register',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //Gift the Creator
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return GiftContainer();
                },
              );
            },
            child: RichText(
              text: TextSpan(
                text: 'Incase its Kawa Like and Gift Me Hmm: ',
                style: TextStyle(
                  fontSize: 10,
                ),
                children: [
                  TextSpan(
                    text: 'Click Me',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
