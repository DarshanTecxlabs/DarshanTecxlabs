import 'dart:convert';

import 'package:tecxlabs_trading_app/common/utils/const.dart';
import 'package:tecxlabs_trading_app/common/data/dependencies/hs_impl/hsdartlib.dart';
import 'package:tecxlabs_trading_app/common/data/mappers/scrip_data_mapper.dart';
import 'package:tecxlabs_trading_app/common/data/models/api_response.dart';
import 'package:tecxlabs_trading_app/common/data/models/scrip_data.dart';
import 'package:tecxlabs_trading_app/common/network/executer.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/market_watch.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/i_stock_repository.dart';

class ScripRepository implements IScripRepository {
  final HSConnection _connection = HSConnection.getInstance();
  final Executer _executer = Executer();
  HSFeedListener? feedListener;

  List<ScripModel> _scrips = [];
  ScripModel _scripSelected = ScripModel();
  List<ScripModel> get scrips => _scrips;
  ScripModel get scrip => _scripSelected;

  ScripRepository._();

  factory ScripRepository() => _instance;

  static ScripRepository get _instance => ScripRepository._();

  // Future<ScripModel> scripModelForDepth(
  //     String token, HSFeedListener feedListener) async {
  //   if (_scrips.any((element) => element.key == token)) {
  //     if (_connection.getStatus() == ConnectionStatus.CONNECTED) {
  //       _connection.subscribeDepth([token], 2);
  //       return _scrips.firstWhere((element) => element.key == token);
  //     } else {
  //       _connection.connectWithXAccessToken(
  //           WEB_SOCKET_URL, feedListener, X_ACESS_TOKEN_TEMP);
  //     }
  //   } else {
  //     String scrip = await _executer.getScripInfo([token]);
  //     await addScrips([scrip]);
  //   }
  // }

  @override
  Future<List<ScripModel>> getAll(
      List<String> scrips, HSFeedListener feedListener) async {
    if (_connection.getStatus() == ConnectionStatus.CONNECTED) {
      return await _subscribeScrips(scrips);
    } else if (_connection.getStatus() == ConnectionStatus.DISCONNECTED) {
      _connection.connectWithXAccessToken(
          WEB_SOCKET_URL, feedListener, await _xAccessToken);
      return await _subscribeScrips(scrips);
    }

    return [];
  }

  Future<String> get _xAccessToken => getSessionValue();

  @override
  Future<List<ScripModel>> change(
    MarketWatch mw,
    HSFeedListener feedListener,
  ) async {
    this.feedListener = feedListener;
    if (_connection.getStatus() == ConnectionStatus.CONNECTED) {
      // _scrips = [];
      // _connection.unsubscribeScrip(old.scrips!.split(","), 1);
      // return await _subscribeScrips(mw);

      return _filterBasedOnMarketWatch(mw);
    } else if (_connection.getStatus() == ConnectionStatus.DISCONNECTED) {
      _connection.connectWithXAccessToken(
          WEB_SOCKET_URL, feedListener, await _xAccessToken);
      // return await _subscribeScrips(mw);
      // return _scrips;
      return _filterBasedOnMarketWatch(mw);
    }
    return [];
  }

  List<ScripModel> _filterBasedOnMarketWatch(MarketWatch mw) {
    List<ScripModel> filteredScrips = [];
    mw.scrips!.split(",").forEach((e) {
      filteredScrips.add(_scrips.firstWhere((element) => element.key == e));
    });
    Future.delayed(Duration(seconds: 1), () {
      return filteredScrips;
    });
    return filteredScrips;
  }

  Future<List<ScripModel>> _subscribeScrips(List<String>? scrips) async {
    Future.delayed(Duration(milliseconds: 200), () {
      _connection.subscribeScrip(scrips!, 1);
    });

    await addScrips(scrips);
    return _scrips;
  }

  Future<void> addScrips(List<String>? scrips) async {
    //*Get Scrip Info and store in the list
    List<dynamic> data = await getApiResponse(scrips!);
    data.forEach((e) {
      ScripData scripData = ScripData.fromJson(e);

      ScripModel scrip = ScripDataMapper.map(scripData);
      bool exists = _scrips.any((element) => element.key == scrip.key);
      if (exists) {
        int index = _scrips
            .indexOf(_scrips.firstWhere((element) => element.key == scrip.key));
        _scrips[index] = scrip;
      } else {
        _scrips.add(scrip);
      }
    });
  }

  Future<List<dynamic>> getApiResponse(List<String> scrips) async {
    String response = await _executer.getScripInfo(scrips);
    List data = ApiResponse.fromJson(jsonDecode(response)).data;
    return data;
  }

  @override
  List<ScripModel> updateScrips(
      String key, List<int?> fieldIndices, List<int?> fieldValues) {
    bool any = _scrips.any((element) => key == element.key);
    if (any) {
      int index =
          _scrips.indexOf(_scrips.firstWhere((element) => element.key == key));
      ScripModel initial = _scrips[index];
      _scrips[index] =
          ScripDataMapper.update(initial, key, fieldIndices, fieldValues);
    }
    return _scrips;
  }

  @override
  Future<ScripModel> subscribeAsDepth(String key) async {
    if (_connection.getStatus() == ConnectionStatus.CONNECTED) {
      Future.delayed(Duration(microseconds: 200), () {
        _connection.subscribeDepth([key], 2);
      });
      var _scripSelected = _scrips.firstWhere((element) => element.key == key);
      return _scripSelected;
    } else if (_connection.getStatus() == ConnectionStatus.DISCONNECTED) {
      _connection.connectWithXAccessToken(
          WEB_SOCKET_URL, feedListener!, await _xAccessToken);
      _connection.subscribeDepth([key], 2);
      var _scripSelected = _scrips.firstWhere((element) => element.key == key);
      return _scripSelected;
    }
    return ScripModel();
  }

  @override
  ScripModel upDateAsDepth(
      String key, List<int?> fieldIndices, List<int?> fieldValue) {
    ScripModel model = ScripDataMapper.mapDepth(
      _scrips.firstWhere((element) => element.key == key),
      key,
      fieldIndices,
      fieldValue,
    );
    int index =
        _scrips.indexOf(_scrips.firstWhere((element) => element.key == key));
    _scrips[index] = model;
    return model;
  }

  @override
  void unsubscribeAsDepth(String key) {
    _connection.unsubscribeDepth([key], 2);
  }
}
