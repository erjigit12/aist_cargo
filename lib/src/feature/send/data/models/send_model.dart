import 'package:json_annotation/json_annotation.dart';

part 'send_model.g.dart';

@JsonSerializable()
class SendModel {
  final String? firstName;
  final String? lastName;
  final String? fromWhere;
  final String? toWhere;
  final String? description;
  final String? dispatchDate;
  final String? arrivalDate;
  final String? packageType;
  final String? size;
  final String? subsDuration;

  SendModel({
    this.firstName,
    this.lastName,
    this.fromWhere,
    this.toWhere,
    this.description,
    this.dispatchDate,
    this.arrivalDate,
    this.packageType,
    this.size,
    this.subsDuration,
  });

  Map<String, dynamic> toJson() => _$SendModelToJson(this);

  factory SendModel.fromJson(Map<String, dynamic> json) =>
      _$SendModelFromJson(json);
}
