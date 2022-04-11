import 'package:flutter/material.dart';
import 'package:flutter_weather/widgets/city_card.dart';

import '../../model/repository/weather_repostiory.dart';
import '../../widgets/input_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CityCard> _cityCards = [];

  void addCity(String? city) async {
    if (city == null) return;

    var cityCoordinates = await WeatherRepository.getCityCoordinates(city);
    if (cityCoordinates.cities.isEmpty) return;

    var currentWeather =
        await WeatherRepository.getCurrentWeather(cityCoordinates.cities[0]);
    var cityCard = CityCard(weatherInfo: currentWeather);

    setState(() {
      _cityCards.add(cityCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog<String>(
                      context: context,
                      builder: (context) => const InputDialog())
                  .then((value) => addCity(value));
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(title: const Text("Flutter Weather")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: _cityCards,
          ),
        ));
  }
}
