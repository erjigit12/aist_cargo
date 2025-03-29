import 'package:aist_cargo/src/feature/feature.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? image;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromMap(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber ?? '',
      dateOfBirth: dateOfBirth ?? '',
      image: image ?? 'assets/images/profile.jpeg',
    );
  }
}
