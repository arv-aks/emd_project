import 'package:emd_project/src/domain/result.dart';
import 'package:geocoding/geocoding.dart';

abstract class RestaurantRepo {
  Future<Result> getRestaurantsBasedOnLocation({required Location location});
}
