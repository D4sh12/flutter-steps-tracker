import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_errors.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = Success<T>;
  const factory Result.failure({required String error}) = Failure<T>;

  static Result<T> guard<T>(T Function() body) {
    try {
      return Result.success(data: body());
    } on Exception catch (error) {
      return Result.failure(error: NetworkErrors.getNetworkError(error));
    }
  }

  static Future<Result<T>> guardFuture<T>(Future<T> Function() future) async {
    try {
      return Result.success(data: await future());
    } on Exception catch (error) {
      return Result.failure(error: NetworkErrors.getNetworkError(error));
    }
  }
}
