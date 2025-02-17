class SignupRegParams {
  SignupRegParams({
    this.id,
    this.name,
    this.surName,
    this.email,
    this.password,
  });

  final String? id;
  final String? name;
  final String? surName;
  final String? email;
  final String? password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surName': surName,
      'email': email,
      'password': password,
    };
  }

  factory SignupRegParams.fromMap(Map<String, dynamic> map) {
    return SignupRegParams(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      surName: map['surName'] != null ? map['surName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
}
