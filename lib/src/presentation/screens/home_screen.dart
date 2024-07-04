import 'package:emd_project/src/application/auth_controller.dart';
import 'package:emd_project/src/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
           Get.to(const ProfileScreen());
          }, icon: const Icon(Icons.person))
        ],
      ),
      body: Center(child: const Text("home"),),);
  }
}