// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDeliveryModel _$CreateDeliveryModelFromJson(Map<String, dynamic> json) =>
    CreateDeliveryModel(
      message: json['message'] as String,
      success: json['success'] as bool,
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      random: (json['random'] as num).toInt(),
    );

Map<String, dynamic> _$CreateDeliveryModelToJson(
        CreateDeliveryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'id': instance.id,
      'userId': instance.userId,
      'random': instance.random,
    };
