// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDeliveryModel _$CreateDeliveryModelFromJson(Map<String, dynamic> json) =>
    CreateDeliveryModel(
      fromWhere: json['fromWhere'] as String?,
      toWhere: json['toWhere'] as String?,
      description: json['description'] as String?,
      dispatchDate: json['dispatchDate'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      userName: json['userName'] as String?,
      transportNumber: json['transportNumber'] as String?,
      size: json['size'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$CreateDeliveryModelToJson(
        CreateDeliveryModel instance) =>
    <String, dynamic>{
      'fromWhere': instance.fromWhere,
      'toWhere': instance.toWhere,
      'description': instance.description,
      'dispatchDate': instance.dispatchDate,
      'arrivalDate': instance.arrivalDate,
      'userName': instance.userName,
      'transportNumber': instance.transportNumber,
      'size': instance.size,
      'success': instance.success,
    };
