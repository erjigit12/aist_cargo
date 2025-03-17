import 'package:json_annotation/json_annotation.dart';

part 'create_subscription_model.g.dart';

@JsonSerializable()
class CreateSubscriptionModel {
  final String userId;
  final String price;
  final String? transportType;
  final String? duration;

  CreateSubscriptionModel({
    required this.userId,
    required this.price,
    this.transportType,
    this.duration,
  });

  Map<String, dynamic> toJson() => _$CreateSubscriptionModelToJson(this);

  factory CreateSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionModelFromJson(json);
}
