class VerifyOtpResponse {
  bool? verified;
  List<int>? data;

  VerifyOtpResponse({
    this.verified,
    this.data,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
    verified: json["verified"],
    data: json["data"] == null ? [] : List<int>.from(json["data"]!.map((x) => x)),
  );

}
