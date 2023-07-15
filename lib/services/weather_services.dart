import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../models/weather.dart';

class WeatherServices {
  final Set<Weather> _weathers = {
    Weather(
      name: 'snowy',
      city: 'city',
      humidity: 76,
      wind: 12,
      perception: 40,
      temperature: -5,
      color: const Color.fromARGB(255, 202, 225, 229),
      icon: LineIcons.snowflake,
    ),
    Weather(
      name: 'sunny',
      city: 'city',
      humidity: 76,
      wind: 13,
      perception: 56,
      temperature: 45,
      color: const Color.fromARGB(255, 207, 219, 177),
      icon: LineIcons.sun,
    ),
    // Weather(
    //   name: 'rainy',
    //   city: 'city',
    //   humidity: 89,
    //   wind: 12,
    //   perception: 50,
    //   temperature: 16,
    //   color: const Color.fromRGBO(26, 27, 54, 1),
    //   icon: LineIcons.cloudWithRain,
    //   whiteForground: true,
    // ),
    Weather(
      name: 'cloudy',
      city: 'city',
      humidity: 45,
      wind: 10,
      perception: 45,
      temperature: 34,
      color: const Color.fromARGB(255, 167, 125, 177),
      icon: LineIcons.cloud,
    ),
  };

  Set<Weather> all() => _weathers;
}
