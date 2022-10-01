import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.model.freezed.dart';

part 'user.model.g.dart';


@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    required String fullName,
    required int healthPoints,
    int? totalSteps,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
