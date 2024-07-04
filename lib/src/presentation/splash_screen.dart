import 'package:emd_project/src/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.find<AuthController>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // child: SvgPicture.asset("assets/splash_icon.svg"),
      child: Text('Splash'),
    ));
  }
}
