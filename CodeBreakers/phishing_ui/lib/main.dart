import 'package:flutter/material.dart';
import 'package:phishing_ui/screens/search_screen.dart';
import 'package:phishing_ui/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search App',
      theme: appTheme, // Apply the custom theme
      home: SearchScreen(),
    );
  }
}
