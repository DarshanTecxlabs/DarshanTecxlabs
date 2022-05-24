import 'package:equatable/equatable.dart';

class Orderentryresponse extends Equatable {
  final int? stCode;
  final String? nOrdNo;
  final String? comment;

  const Orderentryresponse({this.stCode, this.nOrdNo, this.comment});

  factory Orderentryresponse.fromJson(Map<String, dynamic> json) =>
      Orderentryresponse(
        stCode: json['stCode'] as int,
        nOrdNo: json['nOrdNo'] as String,
        comment: json['comment'] as String,
      );

  @override
  List<Object?> get props =>[stCode,nOrdNo,comment];
}
