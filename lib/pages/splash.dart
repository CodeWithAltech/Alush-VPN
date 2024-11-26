// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alush/pages/home.dart';
import 'package:alush/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: // Title
            Text(
          'Alush VPN',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeController.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => themeController.toggleTheme(),
          ),
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Sample Image
          Center(
            child: Image.asset(
              'lib/images/worldd.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        onClosing: () {
          Navigator.pop(context);
        },
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Made By Altech Technologies\n\n',
                  style: TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Welcome to Alush 1.0',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
