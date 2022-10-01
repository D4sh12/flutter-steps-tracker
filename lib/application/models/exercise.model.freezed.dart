// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exercise.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) {
  return _ExerciseModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseModel {
  String get uid => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get consumedTime => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseModelCopyWith<ExerciseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseModelCopyWith<$Res> {
  factory $ExerciseModelCopyWith(
          ExerciseModel value, $Res Function(ExerciseModel) then) =
      _$ExerciseModelCopyWithImpl<$Res>;
  $Res call(
      {String uid, int steps, int points, int consumedTime, String createdAt});
}

/// @nodoc
class _$ExerciseModelCopyWithImpl<$Res>
    implements $ExerciseModelCopyWith<$Res> {
  _$ExerciseModelCopyWithImpl(this._value, this._then);

  final ExerciseModel _value;
  // ignore: unused_field
  final $Res Function(ExerciseModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? steps = freezed,
    Object? points = freezed,
    Object? consumedTime = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      consumedTime: consumedTime == freezed
          ? _value.consumedTime
          : consumedTime // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ExerciseModelCopyWith<$Res>
    implements $ExerciseModelCopyWith<$Res> {
  factory _$$_ExerciseModelCopyWith(
          _$_ExerciseModel value, $Res Function(_$_ExerciseModel) then) =
      __$$_ExerciseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid, int steps, int points, int consumedTime, String createdAt});
}

/// @nodoc
class __$$_ExerciseModelCopyWithImpl<$Res>
    extends _$ExerciseModelCopyWithImpl<$Res>
    implements _$$_ExerciseModelCopyWith<$Res> {
  __$$_ExerciseModelCopyWithImpl(
      _$_ExerciseModel _value, $Res Function(_$_ExerciseModel) _then)
      : super(_value, (v) => _then(v as _$_ExerciseModel));

  @override
  _$_ExerciseModel get _value => super._value as _$_ExerciseModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? steps = freezed,
    Object? points = freezed,
    Object? consumedTime = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ExerciseModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as int,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      consumedTime: consumedTime == freezed
          ? _value.consumedTime
          : consumedTime // ignore: cast_nullable_to_non_nullable
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
class _$_ExerciseModel implements _ExerciseModel {
  _$_ExerciseModel(
      {required this.uid,
      required this.steps,
      required this.points,
      required this.consumedTime,
      required this.createdAt});

  factory _$_ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseModelFromJson(json);

  @override
  final String uid;
  @override
  final int steps;
  @override
  final int points;
  @override
  final int consumedTime;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'ExerciseModel(uid: $uid, steps: $steps, points: $points, consumedTime: $consumedTime, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExerciseModel &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.steps, steps) &&
            const DeepCollectionEquality().equals(other.points, points) &&
            const DeepCollectionEquality()
                .equals(other.consumedTime, consumedTime) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(steps),
      const DeepCollectionEquality().hash(points),
      const DeepCollectionEquality().hash(consumedTime),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_ExerciseModelCopyWith<_$_ExerciseModel> get copyWith =>
      __$$_ExerciseModelCopyWithImpl<_$_ExerciseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseModelToJson(
      this,
    );
  }
}

abstract class _ExerciseModel implements ExerciseModel {
  factory _ExerciseModel(
      {required final String uid,
      required final int steps,
      required final int points,
      required final int consumedTime,
      required final String createdAt}) = _$_ExerciseModel;

  factory _ExerciseModel.fromJson(Map<String, dynamic> json) =
      _$_ExerciseModel.fromJson;

  @override
  String get uid;
  @override
  int get steps;
  @override
  int get points;
  @override
  int get consumedTime;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseModelCopyWith<_$_ExerciseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
