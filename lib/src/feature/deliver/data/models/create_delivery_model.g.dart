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
      fullName: json['fullName'] as String?,
      transportNumber: json['transportNumber'] as String?,
      transportType: json['transportType'] as String?,
      packageType: json['packageType'] as String?,
      truckSize: json['truckSize'] as String?,
      size: json['size'] as String?,
      role: json['role'] as String?,
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
      'fullName': instance.fullName,
      'transportNumber': instance.transportNumber,
      'transportType': instance.transportType,
      'packageType': instance.packageType,
      'truckSize': instance.truckSize,
      'size': instance.size,
      'role': instance.role,
      'success': instance.success,
    };
