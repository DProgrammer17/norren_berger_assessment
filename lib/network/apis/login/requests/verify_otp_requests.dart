class VerifyOtpRequest {
  final String otp;
  final String email;

  VerifyOtpRequest({
    required this.otp,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "email": email,
  };
}
