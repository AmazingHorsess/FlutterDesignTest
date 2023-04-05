import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/Screens/LandingPage.dart';
import 'package:namer_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'dart:ui';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design 1',
      theme: ThemeData(primaryColor: COLOR_WHITE, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat", colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE)),
      home: LandingScreen(),
    );
  }
}
