import 'package:emd_project/gen/assets.gen.dart';
import 'package:emd_project/src/application/auth_controller.dart';
import 'package:emd_project/src/presentation/screens/home_screen.dart';
import 'package:emd_project/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login/SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.appIcon, height: 100, width: 100),
              const Gap(16),
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(16),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  // Handle sign in
                  await controller.signInWithEmailPassword();
                },
                child: const Text('Sign In/Sign Up'),
              ),
              const Gap(16),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    await controller.signInWithGoogle().then((value) {
                      if (value) {
                        Get.offAll(const HomeScreen());
                      }
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 0.5, color: Colors.black45)),
                    child: const Icon(FontAwesomeIcons.google),
                  )),
              const Gap(20),
              Obx(() => Visibility(
                    visible: controller.isLoading.value,
                    child: const CustomLoading(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
