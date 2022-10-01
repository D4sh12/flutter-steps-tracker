// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExerciseModel _$$_ExerciseModelFromJson(Map<String, dynamic> json) =>
    _$_ExerciseModel(
      uid: json['uid'] as String,
      steps: json['steps'] as int,
      points: json['points'] as int,
      consumedTime: json['consumedTime'] as int,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$_ExerciseModelToJson(_$_ExerciseModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'steps': instance.steps,
      'points': instance.points,
      'consumedTime': instance.consumedTime,
      'createdAt': instance.createdAt,
    };
