import 'package:flutter/material.dart';
import 'package:geoLocationAndAddress/homeMainPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    home: HomeMainPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
