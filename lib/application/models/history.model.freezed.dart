// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

/// @nodoc
mixin _$HistoryModel {
  String get uid => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  int get healthPoint => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res>;
  $Res call({String uid, String itemName, int healthPoint, String createdAt});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res> implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  final HistoryModel _value;
  // ignore: unused_field
  final $Res Function(HistoryModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? itemName = freezed,
    Object? healthPoint = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      healthPoint: healthPoint == freezed
          ? _value.healthPoint
          : healthPoint // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$$_HistoryModelCopyWith(
          _$_HistoryModel value, $Res Function(_$_HistoryModel) then) =
      __$$_HistoryModelCopyWithImpl<$Res>;
  @override
  $Res call({String uid, String itemName, int healthPoint, String createdAt});
}

/// @nodoc
class __$$_HistoryModelCopyWithImpl<$Res>
    extends _$HistoryModelCopyWithImpl<$Res>
    implements _$$_HistoryModelCopyWith<$Res> {
  __$$_HistoryModelCopyWithImpl(
      _$_HistoryModel _value, $Res Function(_$_HistoryModel) _then)
      : super(_value, (v) => _then(v as _$_HistoryModel));

  @override
  _$_HistoryModel get _value => super._value as _$_HistoryModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? itemName = freezed,
    Object? healthPoint = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_HistoryModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      healthPoint: healthPoint == freezed
          ? _value.healthPoint
          : healthPoint // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryModel implements _HistoryModel {
  _$_HistoryModel(
      {required this.uid,
      required this.itemName,
      required this.healthPoint,
      required this.createdAt});

  factory _$_HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryModelFromJson(json);

  @override
  final String uid;
  @override
  final String itemName;
  @override
  final int healthPoint;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'HistoryModel(uid: $uid, itemName: $itemName, healthPoint: $healthPoint, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryModel &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.itemName, itemName) &&
            const DeepCollectionEquality()
                .equals(other.healthPoint, healthPoint) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(itemName),
      const DeepCollectionEquality().hash(healthPoint),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      __$$_HistoryModelCopyWithImpl<_$_HistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryModelToJson(
      this,
    );
  }
}

abstract class _HistoryModel implements HistoryModel {
  factory _HistoryModel(
      {required final String uid,
      required final String itemName,
      required final int healthPoint,
      required final String createdAt}) = _$_HistoryModel;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryModel.fromJson;

  @override
  String get uid;
  @override
  String get itemName;
  @override
  int get healthPoint;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
