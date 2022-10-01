// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryModel _$$_HistoryModelFromJson(Map<String, dynamic> json) =>
    _$_HistoryModel(
      uid: json['uid'] as String,
      itemName: json['itemName'] as String,
      healthPoint: json['healthPoint'] as int,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$_HistoryModelToJson(_$_HistoryModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'itemName': instance.itemName,
      'healthPoint': instance.healthPoint,
      'createdAt': instance.createdAt,
    };
