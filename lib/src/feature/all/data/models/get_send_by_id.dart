import 'package:aist_cargo/src/feature/all/domain/entities/send_entity.dart';

class GetSendById extends SendEntity {
  GetSendById({
    required super.id,
    required super.fullName,
    required super.phoneNumber,
    required super.fromWhere,
    required super.toWhere,
    required super.dispatchDate,
    required super.arrivalDate,
    required super.description,
    required super.packageType,
    required super.size,
    required super.status,
  });

  factory GetSendById.fromJson(Map<String, dynamic> json) {
    return GetSendById(
      id: json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      fromWhere: json['fromWhere'],
      toWhere: json['toWhere'],
      dispatchDate: json['dispatchDate'],
      arrivalDate: json['arrivalDate'],
      description: json['description'],
      packageType: json['packageType'],
      size: json['size'],
      status: json['status'],
    );
  }
}
