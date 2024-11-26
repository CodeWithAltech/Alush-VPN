import 'package:alush/pages/splash.dart';
import 'package:alush/themes/color_thems.dart';
import 'package:alush/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'controllers/homecontroller.dart';
import 'helpers/pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive, SharedPreferences, or any other storage
  await Pref.initializeHive();
  Get.put(HomeController());

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themecontroller = Provider.of<ThemeController>(context);
    return GetMaterialApp(
      title: 'Alush',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themecontroller.themeMode,
      home: const SplashPage(),
    );
  }
}
