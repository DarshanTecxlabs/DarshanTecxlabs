import 'package:tecxlabs_trading_app/feature/search/data/ContractSerach.dart';

abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchResults extends SearchState {
  final List<ContractSearch> lstContractSearch;

  SearchResults(this.lstContractSearch);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
