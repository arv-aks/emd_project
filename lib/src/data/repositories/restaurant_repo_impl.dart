import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emd_project/src/core/constants.dart';
import 'package:emd_project/src/data/models/restaurant_model.dart';
import 'package:emd_project/src/domain/api_provider.dart';
import 'package:emd_project/src/domain/repositories/restaurant_repo.dart';
import 'package:emd_project/src/domain/result.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart';

class RestaurantRepoImpl extends RestaurantRepo {
  final Dio _dio;
  RestaurantRepoImpl() : _dio = ApiProvider.getDio();

  @override
  Future<Result> getRestaurantsBasedOnLocation(
      {required Location location}) async {
    final queryParameters = {
      'categories': 'catering.restaurant',
      'filter': "circle:${location.longitude},${location.latitude},5000",
      'bias': 'proximity:77.209,28.61391',
      'limit': '20',
      'apiKey': '2ac00c76f972402c89ad20b991e53c98',
    };

    String url = Uri.decodeComponent(Uri.parse(Constants.baseUrl)
        .replace(queryParameters: queryParameters)
        .toString());

    try {
      final response = await _dio.get(url);

      List<dynamic> featureList = jsonDecode(jsonEncode(response.data['features']));
      final restaurantsList = featureList.map((json) => FeatureModel.fromJson(json)).toList();

      //  List<dynamic> jsonList = json.decode(jsonEncode(response.data));
      //     final assetsList =
      //         jsonList.map((json) => AssetsModel.fromJson(json)).toList();

      // final restaurants =
      //     FeatureModel.fromJson(response.data['features']);

      // print("before return success: $restaurantsList");

      return Success(data: restaurantsList);
    } catch (e) {
        print("Error: $e");
      return Error(exception: Exception("$e"), message: "failure");
    }
  }
}
