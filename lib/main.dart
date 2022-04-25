import 'package:flutter/material.dart';
import 'package:flutter_weather/util/routes.dart';
import 'package:flutter_weather/view/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [GetPage(name: Routes.home, page: () => const HomeScreen())],
      initialRoute: Routes.home,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
