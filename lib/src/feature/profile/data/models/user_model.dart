// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

import 'package:aist_cargo/src/feature/feature.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? image;
  final File? imageFile;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.image,
    this.imageFile,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromMap(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? dateOfBirth,
    String? image,
    File? imageFile,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      image: image ?? this.image,
      imageFile: imageFile ?? this.imageFile,
    );
  }
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
