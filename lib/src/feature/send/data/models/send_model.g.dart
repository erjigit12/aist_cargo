// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendModel _$SendModelFromJson(Map<String, dynamic> json) => SendModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      fromWhere: json['fromWhere'] as String?,
      toWhere: json['toWhere'] as String?,
      description: json['description'] as String?,
      dispatchDate: json['dispatchDate'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      packageType: json['packageType'] as String?,
      size: json['size'] as String?,
      subsDuration: json['subsDuration'] as String?,
    );

Map<String, dynamic> _$SendModelToJson(SendModel instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fromWhere': instance.fromWhere,
      'toWhere': instance.toWhere,
      'description': instance.description,
      'dispatchDate': instance.dispatchDate,
      'arrivalDate': instance.arrivalDate,
      'packageType': instance.packageType,
      'size': instance.size,
      'subsDuration': instance.subsDuration,
    };
