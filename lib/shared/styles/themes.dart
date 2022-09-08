import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode = ThemeData(
  backgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[350],
    elevation: 20.0,
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.white,

  ),
  appBarTheme:   AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: const IconThemeData(
      color: Colors.black
    ),
    titleTextStyle: const TextStyle(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.teal[800],
    ),
  ),
);