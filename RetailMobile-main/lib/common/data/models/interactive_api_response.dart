import 'package:equatable/equatable.dart';

class InteractiveAPIResponse extends Equatable {
  final String? stat;
  final int? stCode;
  final dynamic data;

  const InteractiveAPIResponse({this.stat, this.stCode, this.data});

  factory InteractiveAPIResponse.fromJson(Map<String, dynamic> json) => InteractiveAPIResponse(
        stat: json['stat'] as String?,
        stCode: json['stCode'] as int?,
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'stat': stat,
        'stCode': stCode,
        'data': data,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [stat, stCode, data];
}
