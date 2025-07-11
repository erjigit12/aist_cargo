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
    this.size,
    this.success,
    this.random,
    this.id,
  });

  final int? id;
  final String? fromWhere;
  final String? toWhere;
  final String? description;
  final String? dispatchDate;
  final String? arrivalDate;
  final String? userName;
  final String? transportNumber;
  final String? size;

  final bool? success;
  final int? random;

  Map<String, dynamic> toJson() => _$CreateDeliveryModelToJson(this);

  factory CreateDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryModelFromJson(json);
}
