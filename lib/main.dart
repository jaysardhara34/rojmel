import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rojmel/khataBook/view/customerScreen.dart';
import 'package:rojmel/khataBook/view/homeScreen.dart';
import 'package:rojmel/khataBook/view/splashScreen.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    initialRoute: 'main',
    routes: {
      '/': (context) => SplashScreen(),
      'main': (context) => HomeScreen(),
    },
  ));
}