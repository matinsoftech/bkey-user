class SignupRequest {
  String email;
  String password;
  String? name;
  String? phone;

  SignupRequest({
    required this.email,
    required this.password,
     this.name,
     this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    };
  }
}
class SignupResponse {
  String fbToken;
  String type;
  String message;
  Map<String, dynamic> user;

  SignupResponse({
    required this.fbToken,
    required this.type,
    required this.message,
    required this.user,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      fbToken: json['fb_token'],
      type: json['type'],
      message: json['message'],
      user: json['user'],
    );
  }
}