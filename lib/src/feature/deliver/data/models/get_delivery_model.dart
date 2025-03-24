import 'package:json_annotation/json_annotation.dart';

part 'get_delivery_model.g.dart';

@JsonSerializable()
class CreateDeliveryModel {
  final String message;
  final bool success;
  final int id;
  final int userId;
  final int random;

  CreateDeliveryModel({
    required this.message,
    required this.success,
    required this.id,
    required this.userId,
    required this.random,
  });

  Map<String, dynamic> toJson() => _$CreateDeliveryModelToJson(this);

  factory CreateDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryModelFromJson(json);
}
