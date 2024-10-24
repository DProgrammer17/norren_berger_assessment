class LoginRequest {
  final String email;
  final String name;

  LoginRequest({
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
  };
}
