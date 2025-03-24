import 'package:json_annotation/json_annotation.dart';

part 'get_delivery_model.g.dart';

@JsonSerializable()
class GetDeliveryModel {
  final String message;
  final bool success;
  final int id;
  final int userId;
  final int random;

  GetDeliveryModel({
    required this.message,
    required this.success,
    required this.id,
    required this.userId,
    required this.random,
  });

  Map<String, dynamic> toJson() => _$GetDeliveryModelToJson(this);

  factory GetDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$GetDeliveryModelFromJson(json);
}
