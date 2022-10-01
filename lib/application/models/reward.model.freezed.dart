// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reward.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) {
  return _RewardModel.fromJson(json);
}

/// @nodoc
mixin _$RewardModel {
  String get title => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  int get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardModelCopyWith<RewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardModelCopyWith<$Res> {
  factory $RewardModelCopyWith(
          RewardModel value, $Res Function(RewardModel) then) =
      _$RewardModelCopyWithImpl<$Res>;
  $Res call({String title, String imgUrl, int cost});
}

/// @nodoc
class _$RewardModelCopyWithImpl<$Res> implements $RewardModelCopyWith<$Res> {
  _$RewardModelCopyWithImpl(this._value, this._then);

  final RewardModel _value;
  // ignore: unused_field
  final $Res Function(RewardModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? imgUrl = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RewardModelCopyWith<$Res>
    implements $RewardModelCopyWith<$Res> {
  factory _$$_RewardModelCopyWith(
          _$_RewardModel value, $Res Function(_$_RewardModel) then) =
      __$$_RewardModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, String imgUrl, int cost});
}

/// @nodoc
class __$$_RewardModelCopyWithImpl<$Res> extends _$RewardModelCopyWithImpl<$Res>
    implements _$$_RewardModelCopyWith<$Res> {
  __$$_RewardModelCopyWithImpl(
      _$_RewardModel _value, $Res Function(_$_RewardModel) _then)
      : super(_value, (v) => _then(v as _$_RewardModel));

  @override
  _$_RewardModel get _value => super._value as _$_RewardModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? imgUrl = freezed,
    Object? cost = freezed,
  }) {
    return _then(_$_RewardModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RewardModel implements _RewardModel {
  _$_RewardModel(
      {required this.title, required this.imgUrl, required this.cost});

  factory _$_RewardModel.fromJson(Map<String, dynamic> json) =>
      _$$_RewardModelFromJson(json);

  @override
  final String title;
  @override
  final String imgUrl;
  @override
  final int cost;

  @override
  String toString() {
    return 'RewardModel(title: $title, imgUrl: $imgUrl, cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RewardModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.cost, cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(cost));

  @JsonKey(ignore: true)
  @override
  _$$_RewardModelCopyWith<_$_RewardModel> get copyWith =>
      __$$_RewardModelCopyWithImpl<_$_RewardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RewardModelToJson(
      this,
    );
  }
}

abstract class _RewardModel implements RewardModel {
  factory _RewardModel(
      {required final String title,
      required final String imgUrl,
      required final int cost}) = _$_RewardModel;

  factory _RewardModel.fromJson(Map<String, dynamic> json) =
      _$_RewardModel.fromJson;

  @override
  String get title;
  @override
  String get imgUrl;
  @override
  int get cost;
  @override
  @JsonKey(ignore: true)
  _$$_RewardModelCopyWith<_$_RewardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
