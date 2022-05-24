import 'package:tecxlabs_trading_app/common/data/dependencies/hs_impl/hsdartlib.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/market_watch.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';

abstract class IScripRepository {
  List<ScripModel> updateScrips(
      String key, List<int?> fieldIndices, List<int?> fieldValue);
  Future<List<ScripModel>> change(MarketWatch mw, HSFeedListener feedListener);
  Future<List<ScripModel>> getAll(
      List<String> scrips, HSFeedListener feedListener);
  List<ScripModel> get scrips;
  Future<ScripModel> subscribeAsDepth(String key);
  ScripModel upDateAsDepth(
      String key, List<int?> fieldIndices, List<int?> fieldValue);
  void unsubscribeAsDepth(String key);
}
