// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  factory RestaurantModel({
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'features') @Default([]) List<FeatureModel> features,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}

@freezed
class FeatureModel with _$FeatureModel {
  factory FeatureModel({
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'properties') required PropertiesModel properties,
  }) = _FeatureModel;

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);
}

@freezed
class PropertiesModel with _$PropertiesModel {
  factory PropertiesModel({
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'state') @Default('') String state,
    @JsonKey(name: 'postcode') @Default('') String postcode,
    @JsonKey(name: 'district') @Default('') String district,
    @JsonKey(name: 'housenumber') @Default('') String housenumber,
    @JsonKey(name: 'lon') @Default(0.0) double longitude,
    @JsonKey(name: 'lat') @Default(0.0) double latitude,
    @JsonKey(name: 'formatted') @Default('') String formatted,
    @JsonKey(name: 'contact') required ContactModel contact,
  }) = _PropertiesModel;

  factory PropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$PropertiesModelFromJson(json);
}

@freezed
class ContactModel with _$ContactModel {
  factory ContactModel({
    @JsonKey(name: 'phone') @Default('') String phone,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
}
