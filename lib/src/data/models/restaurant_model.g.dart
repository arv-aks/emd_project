// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantModelImpl _$$RestaurantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantModelImpl(
      type: json['type'] as String? ?? '',
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RestaurantModelImplToJson(
        _$RestaurantModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
    };

_$FeatureModelImpl _$$FeatureModelImplFromJson(Map<String, dynamic> json) =>
    _$FeatureModelImpl(
      type: json['type'] as String? ?? '',
      properties:
          PropertiesModel.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeatureModelImplToJson(_$FeatureModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
    };

_$PropertiesModelImpl _$$PropertiesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertiesModelImpl(
      name: json['name'] as String? ?? '',
      state: json['state'] as String? ?? '',
      postcode: json['postcode'] as String? ?? '',
      district: json['district'] as String? ?? '',
      housenumber: json['housenumber'] as String? ?? '',
      longitude: (json['lon'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['lat'] as num?)?.toDouble() ?? 0.0,
      formatted: json['formatted'] as String? ?? '',
    );

Map<String, dynamic> _$$PropertiesModelImplToJson(
        _$PropertiesModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'state': instance.state,
      'postcode': instance.postcode,
      'district': instance.district,
      'housenumber': instance.housenumber,
      'lon': instance.longitude,
      'lat': instance.latitude,
      'formatted': instance.formatted,
    };
