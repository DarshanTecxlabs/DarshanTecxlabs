import 'dart:convert';

import 'package:tecxlabs_trading_app/common/data/models/api_response.dart';
import 'package:tecxlabs_trading_app/common/network/executer.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/market_watch.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/i_market_watch_repository.dart';

class MarketWatchRepository implements IMarketWatchRepository {
  final Executer _executer = Executer();

  @override
  Future<List<MarketWatch>> getAllMarketWatch() async {
    List<MarketWatch> watchlist = [];
    try {
      String jsonResponse = await _executer.getWatchList();
      final response = ApiResponse.fromJson(jsonDecode(jsonResponse));
      if (response.code == 200) {
        if (response.data is List) {
          response.data.forEach((e) {
            watchlist.add(MarketWatch.fromJson(e));
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return watchlist;
  }
}
