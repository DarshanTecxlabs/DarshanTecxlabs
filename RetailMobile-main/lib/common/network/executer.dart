import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:tecxlabs_trading_app/common/utils/const.dart';
import 'package:tecxlabs_trading_app/common/network/base.dart';
import 'package:tecxlabs_trading_app/common/network/network.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/data/OrderentryRequest.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdingrequest.dart';
import 'package:tecxlabs_trading_app/feature/search/data/ContractSearchReq.dart';

const SCRIPARR = "scripArr";

class Executer {
  final _baseUrl = "https://uathsint.hypertrade.in/";
  final NetworkBase _networkBase = NetworkHandler();

  Future<String> getScripInfo(List<String> body) async {
    return _networkBase.post(
      _baseUrl + "quick/scrip/info",
      {
        "jData": jsonEncode({SCRIPARR: body}),
      },
      headers: {
        "x-access-token": await getSessionValue(),
        // "content-type": "application/x-www-form-urlencoded"
      },
    );
  }

  Future<String> getWatchList() async {
    return _networkBase.post(
      HYPERSYNC_DISCOVERY_URL + "/htpl/userwatchlist/getusergroups",
      "",
      headers: {
        "api-key": HYPERSYNC_DISCOVERY_API_KEY,
        "Content-Type": "application/json",
        "x-access-token": await getSessionValue(),
      },
    );
  }

  Future<String> getOrders() async {
    return _networkBase.post(
      HYPERSYNC_INTERACTIVE_URL + "/quick/user/orders",
      "",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "x-access-token": await getSessionValue(),
      },
    );
  }

  Future<String> getContractSearch(String sKeyWord) async {
    ContractSearchReq contractSerachReq = ContractSearchReq();
    contractSerachReq.search_type = "all";
    contractSerachReq.keyword = sKeyWord;
    contractSerachReq.allowed_exchange = [
      "nse_cm",
      "nse_fo",
      // "mcx_fo",
      // "bse_cm",
      // "bse_fo",
      // "cde_fo",
    ];

    return await _networkBase.post(
      HYPERSYNC_DISCOVERY_URL + "/htpl/search/symbol",
      jsonEncode(contractSerachReq),
      headers: {
        "api-key": HYPERSYNC_DISCOVERY_API_KEY,
        "Content-Type": "application/json",
        "x-access-token": await getSessionValue(),
      },
    );
  }

  Future<String> sendOrderEntryRequest(
      OrderentryRequest orderentryRequest) async {
    var param = new Map<String, dynamic>();
    param["jData"] = jsonEncode(orderentryRequest);

    return await _networkBase.post(
      HYPERSYNC_INTERACTIVE_URL + "/quick/order/place",
      param,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "x-access-token": await getSessionValue(),
      },
    );
  }

  Future<String> getHoldings() async {
    Holdingrequest holdingrequest =
        Holdingrequest(prod: "CNC", brkName: "TECXLABS");

    var param = new Map<String, dynamic>();
    param["jData"] = jsonEncode(holdingrequest);

    return await _networkBase.post(
      HYPERSYNC_INTERACTIVE_URL + "/quick/user/holdings",
      param,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "x-access-token": await getSessionValue(),
      },
    );
  }


  Future<String> getPositions() async {
    return await _networkBase.post(
      HYPERSYNC_INTERACTIVE_URL + "/quick/user/positions",
      '',
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "x-access-token": await getSessionValue(),
      },
    );
  }
}
