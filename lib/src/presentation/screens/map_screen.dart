import 'package:emd_project/src/application/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Restaurants'),
      ),
      body: const SafeArea(
          child: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(37.422131, -122.084801)),
      )),
    );
  }
}
