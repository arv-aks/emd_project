import 'package:emd_project/src/data/models/restaurant_model.dart';
import 'package:emd_project/src/data/repositories/payment_repo_impl.dart';
import 'package:emd_project/src/data/repositories/restaurant_repo_impl.dart';
import 'package:emd_project/src/domain/repositories/payment_repo.dart';
import 'package:emd_project/src/domain/repositories/restaurant_repo.dart';
import 'package:emd_project/src/domain/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  late final RestaurantRepo _restaurantRepo;
  late final PaymentRepo _paymentRepo;

  var isLoading = false.obs;

  RxList<FeatureModel> restaurantList = <FeatureModel>[].obs;

  RxSet<Marker> mapMarkers = <Marker>{}.obs;
  RxBool isMarkersLoading = false.obs;

  late GoogleMapController mapController;

  @override
  void onInit() {
    super.onInit();
    //ask for location permission....
    _restaurantRepo = Get.put<RestaurantRepo>(RestaurantRepoImpl());
    _paymentRepo = Get.put<PaymentRepo>(PaymentRepoImpl());
    getRestaurantsData();
  }

  void getRestaurantsData() async {
    isLoading.value = true;
    //static location:
    final Location location = Location(
        latitude: 28.6204506, longitude: 77.2181178, timestamp: DateTime.now());

    final result =
        await _restaurantRepo.getRestaurantsBasedOnLocation(location: location);

    if (result is Success) {
      final data = result.data as List<FeatureModel>;

      restaurantList.value = data;
    } else if (result is Error) {
      restaurantList.value = [];
    }
    restaurantList.refresh();
    isLoading.value = false;
  }

  void buildMapMarkers() {
    isMarkersLoading.value = true;
    mapMarkers.clear();

    List<Marker> markers = restaurantList.map((element) {
      return Marker(
        markerId: MarkerId(element.hashCode.toString()),
        position:
            LatLng(element.properties.latitude, element.properties.longitude),
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
