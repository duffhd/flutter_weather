import 'package:flutter/material.dart';
import 'package:flutter_weather/util/routes.dart';
import 'package:flutter_weather/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => const HomeScreen(),
      },
      initialRoute: Routes.home,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}