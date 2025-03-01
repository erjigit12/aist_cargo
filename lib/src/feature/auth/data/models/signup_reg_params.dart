class SignupRegParams {
  SignupRegParams({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  factory SignupRegParams.fromMap(Map<String, dynamic> map) {
    return SignupRegParams(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
}
