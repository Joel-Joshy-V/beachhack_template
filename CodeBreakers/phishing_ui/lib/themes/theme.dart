import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.black, // Use primaryColor instead of primarySwatch
  scaffoldBackgroundColor: Colors.grey[300], // Set the global background color
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[300],
    foregroundColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(),
  ),
);
