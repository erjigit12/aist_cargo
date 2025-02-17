class SigninRegParams {
  SigninRegParams({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory SigninRegParams.fromMap(Map<String, dynamic> map) {
    return SigninRegParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
