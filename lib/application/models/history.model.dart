import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.model.freezed.dart';

part 'history.model.g.dart';

@freezed
abstract class HistoryModel with _$HistoryModel {
  factory HistoryModel({
    required String uid,
    required String itemName,
    required int healthPoint,
    required String createdAt,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}
