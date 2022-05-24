import 'package:tecxlabs_trading_app/feature/watchlist/data/models/market_watch.dart';

abstract class IMarketWatchRepository {
  Future<List<MarketWatch>> getAllMarketWatch();
}
