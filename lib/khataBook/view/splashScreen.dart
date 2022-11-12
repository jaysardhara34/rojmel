import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      return Get.offAllNamed('main');

    });
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfffafafa),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Lottie.asset('assets/logo.json'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Rojmel',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Mari E-Rojgaar Book',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
