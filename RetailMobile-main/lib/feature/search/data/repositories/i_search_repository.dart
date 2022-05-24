import 'package:tecxlabs_trading_app/feature/search/data/ContractSerach.dart';

abstract class ISearchRepository {
  Future<List<ContractSearch>> getSearchResult(String sSearchText);
}