import 'package:aist_cargo/src/feature/all/domain/entities/delivery_entity.dart';

class GetDeliveryById extends DeliveryEntity {
  GetDeliveryById({
    required super.id,
    required super.userId,
    required super.userImage,
    required super.fullName,
    required super.transportNumber,
    required super.description,
    required super.fromWhere,
    required super.dispatchDate,
    required super.toWhere,
    required super.arrivalDate,
    required super.size,
    required super.phoneNumber,
    required super.roleType,
  });

  factory GetDeliveryById.fromJson(Map<String, dynamic> json) {
    return GetDeliveryById(
      id: json['id'],
      userId: json['userId'],
      userImage: json['userImage'] ?? '',
      fullName: json['fullName'] ?? '',
      transportNumber: json['transportNumber'] ?? '',
      description: json['description'] ?? '',
      fromWhere: json['fromWhere'] ?? '',
      dispatchDate: json['dispatchDate'] ?? '',
      toWhere: json['toWhere'] ?? '',
      arrivalDate: json['arrivalDate'] ?? '',
      size: json['size'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      roleType: json['roleType'] ?? '',
    );
  }
}
