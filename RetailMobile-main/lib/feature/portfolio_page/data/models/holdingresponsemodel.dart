import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdings_model.dart';

class HoldingResponse extends Equatable {
  final String? stat;
  final int? stCode;
  final dynamic hldVal;

  const HoldingResponse({this.stat, this.stCode, this.hldVal});

  factory HoldingResponse.fromJson(Map<String, dynamic> json) =>
      HoldingResponse(
        stat: json['stat'] as String?,
        stCode: json['stCode'] as int?,
        hldVal: json['hldVal'],
      );

  Map<String, dynamic> toJson() => {
        'stat': stat,
        'stCode': stCode,
        'hldVal': hldVal,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [stat, stCode, hldVal];
}
