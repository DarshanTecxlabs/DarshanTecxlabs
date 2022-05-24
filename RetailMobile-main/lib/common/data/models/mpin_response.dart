// To parse this JSON data, do
//
//     final mpinResponse = mpinResponseFromJson(jsonString);

import 'dart:convert';

MpinResponse mpinResponseFromJson(String str) => MpinResponse.fromJson(json.decode(str));

String mpinResponseToJson(MpinResponse data) => json.encode(data.toJson());

class MpinResponse {
  MpinResponse({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  int code;
  Data data;

  factory MpinResponse.fromJson(Map<String, dynamic> json) => MpinResponse(
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
    required this.status,
    required this.sessionKey,
    required this.server,
    required this.preferences,
  });

  String status;
  String sessionKey;
  String server;
  Preferences preferences;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    sessionKey: json["sessionKey"],
    server: json["server"],
    preferences: Preferences.fromJson(json["preferences"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sessionKey": sessionKey,
    "server": server,
    "preferences": preferences.toJson(),
  };
}

class Preferences {
  Preferences({
    required this.dashboard,
    required this.stockdetail,
    required this.news,
  });

  List<String> dashboard;
  List<String> stockdetail;
  List<String> news;

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
    // dashboard: List<String>.from(json["dashboard"].map((x) => x)),
    // stockdetail: List<String>.from(json["stockdetail"].map((x) => x)),
    // news: List<String>.from(json["news"].map((x) => x)),
    dashboard:[],
    stockdetail:[],
    news:[]
  );

  Map<String, dynamic> toJson() => {
    "dashboard": List<dynamic>.from(dashboard.map((x) => x)),
    "stockdetail": List<dynamic>.from(stockdetail.map((x) => x)),
    "news": List<dynamic>.from(news.map((x) => x)),
  };
}
