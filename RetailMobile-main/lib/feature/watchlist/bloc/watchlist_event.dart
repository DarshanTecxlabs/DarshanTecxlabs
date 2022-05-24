part of 'watchlist_bloc.dart';

@immutable
abstract class WatchlistEvent {}

class Load extends WatchlistEvent {}

class Loaded extends WatchlistEvent {}

class ChangeWatchList extends WatchlistEvent {
  final MarketWatch marketWatch;

  ChangeWatchList(this.marketWatch);
}

class Update extends WatchlistEvent {
  final MarketWatch marketWatch;

  Update(this.marketWatch);
}

class SearchTextChange extends WatchlistEvent{
  final String sSearchText;
  SearchTextChange(this.sSearchText);  
}
