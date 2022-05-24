// To parse this JSON data, do
//
//     final forgotPasswordResponse = forgotPasswordResponseFromJson(jsonString);

import 'dart:convert';

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));

String forgotPasswordResponseToJson(ForgotPasswordResponse data) => json.encode(data.toJson());

class ForgotPasswordResponse {
  ForgotPasswordResponse({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  Data data;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => ForgotPasswordResponse(
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
    required this.requestCode,
  });

  String message;
  int requestCode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    requestCode: json["requestCode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "requestCode": requestCode,
  };
}
