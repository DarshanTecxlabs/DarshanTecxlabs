import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecxlabs_trading_app/feature/search/bloc/search_event.dart';
import 'package:tecxlabs_trading_app/feature/search/bloc/search_state.dart';
import 'package:tecxlabs_trading_app/feature/search/data/ContractSerach.dart';
import 'package:tecxlabs_trading_app/feature/search/data/repositories/SearchRepository.dart';
import 'package:tecxlabs_trading_app/feature/search/data/repositories/i_search_repository.dart';

class Searchbloc extends Bloc<SearchEvent, SearchState> {
  Searchbloc() : super(SearchLoading());
final ISearchRepository _searchRepository = SearchRepository();
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is LoadSearch) {
      yield(SearchLoading());
    } else if (event is SearchChange) {
      try {
          List<ContractSearch> lstContractSearch = await _searchRepository.getSearchResult(event.sSearchText);
        yield(SearchResults(lstContractSearch));
      } catch (error) {
        yield(SearchError(error.toString()));
      }
    }
  }
}
