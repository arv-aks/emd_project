import 'package:emd_project/src/application/home_controller.dart';
import 'package:emd_project/src/data/models/restaurant_model.dart';
import 'package:emd_project/src/presentation/screens/map_screen.dart';
import 'package:emd_project/src/presentation/screens/profile_screen.dart';
import 'package:emd_project/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const ProfileScreen());
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: SafeArea(
        child: controller.isLoading.value
            ? const CustomLoading()
            : Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Nearby Restaurants'),
                          TextButton.icon(
                            onPressed: () {
                              Get.to(const MapScreen());
                            },
                            label: const Text('Show on Map'),
                            icon: const Icon(FontAwesomeIcons.arrowRight,
                                size: 16),
                            iconAlignment: IconAlignment.end,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemCount: controller.restaurantList.length,
                          itemBuilder: (context, index) {
                            final restaurant = controller.restaurantList[index];
                            return RestaurantCard(
                                restaurantProperties: restaurant.properties);
                          },
                          separatorBuilder: (context, index) => const Gap(10)),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurantProperties});

  final PropertiesModel restaurantProperties;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Text(restaurantProperties.name),
          Text(restaurantProperties.formatted),
        ],
      ),
    );
  }
}
