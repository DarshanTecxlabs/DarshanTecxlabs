import 'package:equatable/equatable.dart';

class MarketWatch extends Equatable {
  final String? mwName;
  final String? scrips;

  const MarketWatch({this.mwName, this.scrips});

  factory MarketWatch.fromJson(Map<String, dynamic> json) => MarketWatch(
        mwName: json['mwName'] as String?,
        scrips: json['scrips'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mwName': mwName,
        'scrips': scrips,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [mwName, scrips];
}
