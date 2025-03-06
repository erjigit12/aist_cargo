import 'package:aist_cargo/src/feature/feature.dart';

class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? image;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber ?? '',
      dateOfBirth: dateOfBirth ?? '',
      image: image ?? 'assets/images/profile.jpeg',
    );
  }
}
