import 'package:emd_project/src/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final user = authController.user;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),
        body: SafeArea(
      child: user != null
          ? Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(user.photoURL.toString())),
                ),
                const Gap(12),
                Text('${user.displayName}'),
                const Gap(12),
                Text('${user.email}'),
                const Gap(12),
                Text('Auth id: ${user.uid}'),
                const Gap(30),
                TextButton.icon(
                  label: const Text('LogOut'),
                  icon: const Icon(Icons.logout),
                  onPressed: () async{
                   await authController.logout();
                  },
                )
              ],
            ))
          : const Center(
              child: Text("Something went wrong"),
            ),
    ));
  }
}
