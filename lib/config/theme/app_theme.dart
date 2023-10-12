import 'package:flutter/material.dart';

const Color customColor = Color.fromARGB(0, 14, 14, 212);

const List<Color> colorsData = [
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.grey
];

class AppTheme{
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorsData[1],
      brightness: Brightness.dark//Tema Oscuro
    );
  }
}