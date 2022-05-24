part of 'watchlist_bloc.dart';

@immutable
abstract class WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<MarketWatch> watchlists;

  WatchlistLoaded(this.watchlists);
}

class WatchlistLoadComplete extends WatchlistState {
  final List<MarketWatch> watchlists;
  final List<ScripModel> stocks;

  WatchlistLoadComplete(this.watchlists, this.stocks);
}

class WatchlistError extends WatchlistState {
  final String message;

  WatchlistError(this.message);
}
