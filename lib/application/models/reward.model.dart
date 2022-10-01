import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward.model.freezed.dart';

part 'reward.model.g.dart';

@freezed
abstract class RewardModel with _$RewardModel {
  factory RewardModel({
    required String title,
    required String imgUrl,
    required int cost,
  }) = _RewardModel;

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
}
