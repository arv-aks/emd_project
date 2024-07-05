import 'package:emd_project/src/data/models/restaurant_model.dart';
import 'package:emd_project/src/domain/repositories/payment_repo.dart';
import 'package:emd_project/src/domain/repositories/restaurant_repo.dart';
import 'package:emd_project/src/domain/result.dart';
import 'package:emd_project/src/presentation/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

enum LocationStatus {
  inProgress,
  success,
  failure,
}

//Home Screen controller
//Some methods can be moved to another repositories to make the core more readable. 

class HomeController extends GetxController {
  final RestaurantRepo _restaurantRepo = Get.find<RestaurantRepo>();
  final PaymentRepo _paymentRepo = Get.find<PaymentRepo>();

  var isLoading = false.obs;

  RxList<FeatureModel> restaurantList = <FeatureModel>[].obs;

  RxSet<Marker> mapMarkers = <Marker>{}.obs;
  RxBool isMarkersLoading = false.obs;

  late GoogleMapController mapController;

  Rx<LocationStatus> locationStatus = LocationStatus.inProgress.obs;
  Position? position;

  void initLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!isServiceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    Future<void> handlePosition() async {
      final currentPosition = await getCurrentLocation();
      if (currentPosition is Success<Position?>) {
        final pos = currentPosition.data;
        position = pos;
        locationStatus.value = LocationStatus.success;
        await getRestaurantsData(position: position);
      } else {
        locationStatus.value = LocationStatus.failure;
      }
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      await handlePosition();
    } else if (permission == LocationPermission.deniedForever) {
      await openAppSettings().then(
        (value) async {
          if (value) {
            await handlePosition();
          } else {
            locationStatus.value = LocationStatus.failure;
          }
        },
      );
    } else {
      locationStatus.value = LocationStatus.failure;
    }
  }

  Future<Result<Position?>> getCurrentLocation() async {
    Position? position;
    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
              timeLimit: const Duration(seconds: 5))
          .then((pos) async {
        position = pos;
      });

      return Success(data: position);
    } catch (err) {
      return Error(
          exception: Exception(err.toString()),
          message: "Error while getting location");
    }
  }

  Future<void> getRestaurantsData({required Position? position}) async {
    if (position != null) {
      isLoading.value = true;

      //static location:
      final Location location = Location(
          latitude: position.latitude,
          longitude: position.longitude,
          timestamp: DateTime.now());

      final result = await _restaurantRepo.getRestaurantsBasedOnLocation(
          location: location);

      if (result is Success) {
        final data = result.data as List<FeatureModel>;

        restaurantList.value = data;
      } else if (result is Error) {
        restaurantList.value = [];
      }
      restaurantList.refresh();
      isLoading.value = false;
    }
  }

  void buildMapMarkers() {
    isMarkersLoading.value = true;
    mapMarkers.clear();

    List<Marker> markers = restaurantList.map((element) {
      return Marker(
        markerId: MarkerId(element.hashCode.toString()),
        position:
            LatLng(element.properties.latitude, element.properties.longitude),
        onTap: () {
          RestaurantCard.showMakePaymentDialog(properties: element.properties);
        },
      );
    }).toList();

    mapMarkers.addAll(markers);
    isMarkersLoading.value = false;

    //move camera
    Future.delayed(const Duration(milliseconds: 1500)).then((_) {
      moveMapCamera();
    });
  }

  Future<(bool, String?)> makePayment() async {
    try {
      final result = await _paymentRepo.createPaymentIntent();

      if (result is Success) {
        final res = result.data as Map<String, dynamic>;

        Map<String, dynamic> paymentIntent = res;
        var gPay = const PaymentSheetGooglePay(
          merchantCountryCode: "US",
          currencyCode: "US",
          testEnv: true,
        );

        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent["client_secret"],
          style: ThemeMode.light,
          merchantDisplayName: "Restro App",
          googlePay: gPay,
        ));

        await Stripe.instance.presentPaymentSheet();

        return (true, "Success");
      } else {
        return (false, "Failure");
      }
    } on StripeException catch (e) {
      return (false, "${e.error}");
    } catch (e) {
      return (false, "$e");
    }
  }

  void initializeMapController(GoogleMapController mController) {
    mapController = mController;
  }

  moveMapCamera() {
    mapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(mapMarkers.first.position.latitude,
            mapMarkers.first.position.longitude),
        14));
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }
}
