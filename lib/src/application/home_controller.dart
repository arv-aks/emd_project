import 'package:emd_project/src/data/models/restaurant_model.dart';
import 'package:emd_project/src/data/repositories/restaurant_repo_impl.dart';
import 'package:emd_project/src/domain/repositories/restaurant_repo.dart';
import 'package:emd_project/src/domain/result.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final RestaurantRepo _restaurantRepo;

  var isLoading = false.obs;

  RxList<FeatureModel> restaurantList = <FeatureModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    //ask for location permission....
    _restaurantRepo = Get.put<RestaurantRepo>(RestaurantRepoImpl());
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

    isLoading.value = false;
  }
}
