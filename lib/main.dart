// Dart imports
import 'dart:io';

// Package imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Widget Imports
import './providers/great_places.dart';
import './screens/places_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: GreatPlaces(),
        child: Platform.isIOS
            ? CupertinoApp(
                title: 'Great Places',
                debugShowCheckedModeBanner: false,
                theme: CupertinoThemeData(
                  primaryColor: Colors.white,
                  primaryContrastingColor: CupertinoColors.systemIndigo,
                  barBackgroundColor: CupertinoColors.systemIndigo,
                  textTheme: CupertinoTextThemeData(
                    navTitleTextStyle: TextStyle(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    navLargeTitleTextStyle: TextStyle(
                      fontFamily: 'Cupertino',
                      color: CupertinoColors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                initialRoute: '/',
                routes: {
                  '/': (ctx) => PlacesListScreen(),
                },
              )
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Great Places',
                theme: ThemeData(
                  primarySwatch: Colors.indigo,
                  accentColor: Colors.amber,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                initialRoute: '/',
                routes: {
                  '/': (ctx) => PlacesListScreen(),
                },
              ));
  }
}
