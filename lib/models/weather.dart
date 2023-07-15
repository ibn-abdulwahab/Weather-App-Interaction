// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Weather {
  String name;
  String city;
  int temperature, wind, perception, humidity;
  Color color;
  IconData icon;
  bool whiteForground;
  Weather({
    required this.name,
    required this.city,
    required this.humidity,
    required this.wind,
    required this.perception,
    required this.temperature,
    required this.color,
    required this.icon,
    this.whiteForground = false,
  });
}
