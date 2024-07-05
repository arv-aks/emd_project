import 'package:emd_project/gen/assets.gen.dart';
import 'package:emd_project/src/application/home_controller.dart';
import 'package:emd_project/src/data/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RestaurantCard extends GetView<HomeController> {
  const RestaurantCard({super.key, required this.restaurantProperties});

  final PropertiesModel restaurantProperties;

  static void showMakePaymentDialog({required PropertiesModel properties}) {
    final homeController = Get.find<HomeController>();
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              properties.name.isNotEmpty
                  ? properties.name
                  : "${properties.housenumber} ${properties.district}",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const Gap(10),
            const Text("Checking out ?"),
            const Gap(10),
            TextButton.icon(
              onPressed: () async {
                await homeController.makePayment().then(
                  (value) {
                    Get.back();
                    Get.snackbar("Payment", "${value.$2}");
                  },
                );
              },
              label: const Text('Make Payment'),
              icon: const Icon(FontAwesomeIcons.moneyBill),
            )
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMakePaymentDialog(properties: restaurantProperties);
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.images.appIcon,
                height: 30,
                width: 30,
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurantProperties.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const Gap(4),
                    Text(restaurantProperties.formatted),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
