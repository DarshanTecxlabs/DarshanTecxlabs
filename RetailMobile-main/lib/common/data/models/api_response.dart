import 'package:equatable/equatable.dart';

class ApiResponse extends Equatable {
  final String? status;
  final int? code;
  final dynamic data;

  const ApiResponse({this.status, this.code, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json['status'] as String?,
        code: json['code'] as int?,
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'data': data,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, code, data];
}
