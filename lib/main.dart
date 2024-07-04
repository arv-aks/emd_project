import 'dart:async';

import 'package:emd_project/firebase_options.dart';
import 'package:emd_project/src/application/auth_controller.dart';
import 'package:emd_project/src/application/home_controller.dart';
import 'package:emd_project/src/data/repositories/restaurant_repo_impl.dart';
import 'package:emd_project/src/domain/repositories/restaurant_repo.dart';
import 'package:emd_project/src/presentation/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    print("Flutter error: $details");
  };

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      //configure dependencies
      initDependencies();
      //for stripe payment integration
      Stripe.publishableKey =
          "pk_test_51PYtoFIrqOXT1j7hTYnSn6GvFxNLtXncMNR24vt227U4Y5r4QIVkD1NRTSfPVMioQPeaMdDF9khjdyN7qqUcDflr00gKQZQQQ8";
      runApp(const MyApp());
    },
    (error, stack) {
      print("run zoned: $error");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const SplashScreen(),
    );
  }
}

void initDependencies() {
  Get.lazyPut<AuthController>(() => AuthController());
  Get.put<HomeController>(HomeController());
  Get.lazyPut<RestaurantRepo>(() => RestaurantRepoImpl());
}
