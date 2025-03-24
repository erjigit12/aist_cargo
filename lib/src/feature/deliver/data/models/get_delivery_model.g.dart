// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDeliveryModel _$GetDeliveryModelFromJson(Map<String, dynamic> json) =>
    GetDeliveryModel(
      message: json['message'] as String,
      success: json['success'] as bool,
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      random: (json['random'] as num).toInt(),
    );

Map<String, dynamic> _$GetDeliveryModelToJson(GetDeliveryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'id': instance.id,
      'userId': instance.userId,
      'random': instance.random,
    };
