class OtpResponse {
  final int code;

  OtpResponse({required this.code});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
