class LoginResponse {
  String? data;
  String? message;

  LoginResponse({
    this.data,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: json["data"],
    message: json["message"],
  );
}
