// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.message,
    required this.devicempinkey,
  });

  String message;
  String devicempinkey;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    devicempinkey: json["devicempinkey"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "devicempinkey": devicempinkey,
  };
}
