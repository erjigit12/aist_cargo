// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSubscriptionModel _$CreateSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    CreateSubscriptionModel(
      userId: json['userId'] as String,
      price: json['price'] as String,
      transportType: json['transportType'] as String?,
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$CreateSubscriptionModelToJson(
        CreateSubscriptionModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'price': instance.price,
      'transportType': instance.transportType,
      'duration': instance.duration,
    };
