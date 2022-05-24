import 'dart:convert';

import 'package:tecxlabs_trading_app/common/data/models/api_response.dart';
import 'package:tecxlabs_trading_app/common/network/executer.dart';
import 'package:tecxlabs_trading_app/feature/search/data/ContractSerach.dart';
import 'package:tecxlabs_trading_app/feature/search/data/repositories/i_search_repository.dart';

class SearchRepository implements ISearchRepository {
  Executer _executer = Executer();

  @override
  Future<List<ContractSearch>> getSearchResult(String sSearchText) async {
    List<ContractSearch> lstContractSearch = [];
    try {
      String jsonResponse = await _executer.getContractSearch(sSearchText);
      final response = ApiResponse.fromJson(jsonDecode(jsonResponse));
      print(response.toString());
      if (response.code == 200) {
        if (response.data is List) {
          response.data.forEach((e) {
            lstContractSearch.add(ContractSearch.fromJson(e));
          });
        }
      }
    } catch (error) {
         print(error.toString());
    }
    return lstContractSearch;
  }
}
