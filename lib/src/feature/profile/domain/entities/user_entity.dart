// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class UserEntity {
  UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.image,
    this.imageFile,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? image;
  final File? imageFile;

  UserEntity copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? dateOfBirth,
    String? image,
    File? imageFile,
  }) {
    return UserEntity(
      id: id ?? this.id,
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
