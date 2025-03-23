import 'package:json_annotation/json_annotation.dart';

part 'create_delivery_model.g.dart';

@JsonSerializable()
class CreateDeliveryModel {
  CreateDeliveryModel({
    this.fromWhere,
    this.toWhere,
    this.description,
    this.dispatchDate,
    this.arrivalDate,
    this.userName,
    this.transportNumber,
    // this.transportType,
    // this.packageType,
    // this.truckSize,
    this.size,
    // this.role,
    this.success,
  });

  final String? fromWhere;
  final String? toWhere;
  final String? description;
  final String? dispatchDate;
  final String? arrivalDate;
  final String? userName;
  final String? transportNumber;
  // final String? transportType;
  // final String? packageType;
  // final String? truckSize;
  final String? size;
  // final String? role;
  final bool? success;

  Map<String, dynamic> toJson() => _$CreateDeliveryModelToJson(this);

  factory CreateDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryModelFromJson(json);
}
