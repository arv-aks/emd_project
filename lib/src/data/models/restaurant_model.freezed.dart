// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) {
  return _FeatureModel.fromJson(json);
}

/// @nodoc
mixin _$FeatureModel {
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'properties')
  PropertiesModel get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureModelCopyWith<FeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureModelCopyWith<$Res> {
  factory $FeatureModelCopyWith(
          FeatureModel value, $Res Function(FeatureModel) then) =
      _$FeatureModelCopyWithImpl<$Res, FeatureModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'properties') PropertiesModel properties});

  $PropertiesModelCopyWith<$Res> get properties;
}

/// @nodoc
class _$FeatureModelCopyWithImpl<$Res, $Val extends FeatureModel>
    implements $FeatureModelCopyWith<$Res> {
  _$FeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as PropertiesModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PropertiesModelCopyWith<$Res> get properties {
    return $PropertiesModelCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeatureModelImplCopyWith<$Res>
    implements $FeatureModelCopyWith<$Res> {
  factory _$$FeatureModelImplCopyWith(
          _$FeatureModelImpl value, $Res Function(_$FeatureModelImpl) then) =
      __$$FeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'properties') PropertiesModel properties});

  @override
  $PropertiesModelCopyWith<$Res> get properties;
}

/// @nodoc
class __$$FeatureModelImplCopyWithImpl<$Res>
    extends _$FeatureModelCopyWithImpl<$Res, _$FeatureModelImpl>
    implements _$$FeatureModelImplCopyWith<$Res> {
  __$$FeatureModelImplCopyWithImpl(
      _$FeatureModelImpl _value, $Res Function(_$FeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? properties = null,
  }) {
    return _then(_$FeatureModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as PropertiesModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureModelImpl implements _FeatureModel {
  _$FeatureModelImpl(
      {@JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'properties') required this.properties});

  factory _$FeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureModelImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'properties')
  final PropertiesModel properties;

  @override
  String toString() {
    return 'FeatureModel(type: $type, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, properties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      __$$FeatureModelImplCopyWithImpl<_$FeatureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureModelImplToJson(
      this,
    );
  }
}

abstract class _FeatureModel implements FeatureModel {
  factory _FeatureModel(
      {@JsonKey(name: 'type') final String type,
      @JsonKey(name: 'properties')
      required final PropertiesModel properties}) = _$FeatureModelImpl;

  factory _FeatureModel.fromJson(Map<String, dynamic> json) =
      _$FeatureModelImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'properties')
  PropertiesModel get properties;
  @override
  @JsonKey(ignore: true)
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PropertiesModel _$PropertiesModelFromJson(Map<String, dynamic> json) {
  return _PropertiesModel.fromJson(json);
}

/// @nodoc
mixin _$PropertiesModel {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'postcode')
  String get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  String get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'housenumber')
  String get housenumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lon')
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted')
  String get formatted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertiesModelCopyWith<PropertiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertiesModelCopyWith<$Res> {
  factory $PropertiesModelCopyWith(
          PropertiesModel value, $Res Function(PropertiesModel) then) =
      _$PropertiesModelCopyWithImpl<$Res, PropertiesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'postcode') String postcode,
      @JsonKey(name: 'district') String district,
      @JsonKey(name: 'housenumber') String housenumber,
      @JsonKey(name: 'lon') double longitude,
      @JsonKey(name: 'lat') double latitude,
      @JsonKey(name: 'formatted') String formatted});
}

/// @nodoc
class _$PropertiesModelCopyWithImpl<$Res, $Val extends PropertiesModel>
    implements $PropertiesModelCopyWith<$Res> {
  _$PropertiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? state = null,
    Object? postcode = null,
    Object? district = null,
    Object? housenumber = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? formatted = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postcode: null == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      housenumber: null == housenumber
          ? _value.housenumber
          : housenumber // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      formatted: null == formatted
          ? _value.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertiesModelImplCopyWith<$Res>
    implements $PropertiesModelCopyWith<$Res> {
  factory _$$PropertiesModelImplCopyWith(_$PropertiesModelImpl value,
          $Res Function(_$PropertiesModelImpl) then) =
      __$$PropertiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'postcode') String postcode,
      @JsonKey(name: 'district') String district,
      @JsonKey(name: 'housenumber') String housenumber,
      @JsonKey(name: 'lon') double longitude,
      @JsonKey(name: 'lat') double latitude,
      @JsonKey(name: 'formatted') String formatted});
}

/// @nodoc
class __$$PropertiesModelImplCopyWithImpl<$Res>
    extends _$PropertiesModelCopyWithImpl<$Res, _$PropertiesModelImpl>
    implements _$$PropertiesModelImplCopyWith<$Res> {
  __$$PropertiesModelImplCopyWithImpl(
      _$PropertiesModelImpl _value, $Res Function(_$PropertiesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? state = null,
    Object? postcode = null,
    Object? district = null,
    Object? housenumber = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? formatted = null,
  }) {
    return _then(_$PropertiesModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postcode: null == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      housenumber: null == housenumber
          ? _value.housenumber
          : housenumber // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      formatted: null == formatted
          ? _value.formatted
          : formatted // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertiesModelImpl implements _PropertiesModel {
  _$PropertiesModelImpl(
      {@JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'state') this.state = '',
      @JsonKey(name: 'postcode') this.postcode = '',
      @JsonKey(name: 'district') this.district = '',
      @JsonKey(name: 'housenumber') this.housenumber = '',
      @JsonKey(name: 'lon') this.longitude = 0.0,
      @JsonKey(name: 'lat') this.latitude = 0.0,
      @JsonKey(name: 'formatted') this.formatted = ''});

  factory _$PropertiesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertiesModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'state')
  final String state;
  @override
  @JsonKey(name: 'postcode')
  final String postcode;
  @override
  @JsonKey(name: 'district')
  final String district;
  @override
  @JsonKey(name: 'housenumber')
  final String housenumber;
  @override
  @JsonKey(name: 'lon')
  final double longitude;
  @override
  @JsonKey(name: 'lat')
  final double latitude;
  @override
  @JsonKey(name: 'formatted')
  final String formatted;

  @override
  String toString() {
    return 'PropertiesModel(name: $name, state: $state, postcode: $postcode, district: $district, housenumber: $housenumber, longitude: $longitude, latitude: $latitude, formatted: $formatted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertiesModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.housenumber, housenumber) ||
                other.housenumber == housenumber) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.formatted, formatted) ||
                other.formatted == formatted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, state, postcode, district,
      housenumber, longitude, latitude, formatted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertiesModelImplCopyWith<_$PropertiesModelImpl> get copyWith =>
      __$$PropertiesModelImplCopyWithImpl<_$PropertiesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertiesModelImplToJson(
      this,
    );
  }
}

abstract class _PropertiesModel implements PropertiesModel {
  factory _PropertiesModel(
          {@JsonKey(name: 'name') final String name,
          @JsonKey(name: 'state') final String state,
          @JsonKey(name: 'postcode') final String postcode,
          @JsonKey(name: 'district') final String district,
          @JsonKey(name: 'housenumber') final String housenumber,
          @JsonKey(name: 'lon') final double longitude,
          @JsonKey(name: 'lat') final double latitude,
          @JsonKey(name: 'formatted') final String formatted}) =
      _$PropertiesModelImpl;

  factory _PropertiesModel.fromJson(Map<String, dynamic> json) =
      _$PropertiesModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'state')
  String get state;
  @override
  @JsonKey(name: 'postcode')
  String get postcode;
  @override
  @JsonKey(name: 'district')
  String get district;
  @override
  @JsonKey(name: 'housenumber')
  String get housenumber;
  @override
  @JsonKey(name: 'lon')
  double get longitude;
  @override
  @JsonKey(name: 'lat')
  double get latitude;
  @override
  @JsonKey(name: 'formatted')
  String get formatted;
  @override
  @JsonKey(ignore: true)
  _$$PropertiesModelImplCopyWith<_$PropertiesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
