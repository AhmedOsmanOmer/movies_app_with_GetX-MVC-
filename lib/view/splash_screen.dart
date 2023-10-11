import 'package:flutter/material.dart';
import 'package:flutter_mid_level/main.dart';
import 'package:flutter_mid_level/view/home.dart';
import 'package:flutter_mid_level/view/login.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 3), () {
     Get.off(()=>pref.getString('email')!=null?const Home():LoginScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}