import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecxlabs_trading_app/common/data/dependencies/hs_impl/hsdartlib.dart';
import 'package:tecxlabs_trading_app/feature/scrip/bloc/scrip_bloc.dart';
import 'package:tecxlabs_trading_app/feature/search/bloc/search_bloc.dart';
import 'package:tecxlabs_trading_app/feature/search/bloc/search_event.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/market_watch.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/i_market_watch_repository.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/i_stock_repository.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/market_watch_repository.dart';

import '../../../inject.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState>
    implements HSFeedListener {
  final IMarketWatchRepository _marketWatchRepository = MarketWatchRepository();
  final IScripRepository _scripRepository = getIt<IScripRepository>();
  Map<MarketWatch, List<ScripModel>> allData = {};
  final Searchbloc searchbloc;
  WatchlistBloc({required this.searchbloc}) : super(WatchlistLoading());
  MarketWatch selected = MarketWatch();
  @override
  Stream<WatchlistState> mapEventToState(
    WatchlistEvent event,
  ) async* {
    // print("WB::" + _scripRepository.scrips.toString());
    List<MarketWatch> allMarketWatch = [];
    allMarketWatch = await _marketWatchRepository.getAllMarketWatch();
    // if (allData.isEmpty) {
    //   allMarketWatch = await _marketWatchRepository.getAllMarketWatch();

    //   allMarketWatch.forEach((element) async {
    //     List<ScripModel> scrip =
    //         await _scripRepository.getAll(element.scrips!.split(","), this);
    //     allData[element] = scrip;
    //   });
    // }
    if (event is Load) {
      try {
        allMarketWatch = await _marketWatchRepository.getAllMarketWatch();
        yield WatchlistLoaded(allMarketWatch);
      } catch (e) {
        yield WatchlistError(e.toString());
      }
    } else if (event is Loaded) {
      yield WatchlistLoading();
      try {
        List<String> scrips = [];
        allMarketWatch.forEach((element) {
          List<String> scr = element.scrips!.split(",");
          scr.forEach((element) {
            if (!scrips.contains(element)) {
              scrips.add(element);
            }
          });
        });
        List<ScripModel> stocksList =
            await _scripRepository.getAll(scrips, this);

        // yield WatchlistLoadComplete(allMarketWatch, stocksList);
        // yield WatchlistLoading();
        selected = allMarketWatch[0];
        List<ScripModel> scripsToShow =
            await _scripRepository.change(allMarketWatch[0], this);
        yield WatchlistLoadComplete(allMarketWatch, scripsToShow);
      } catch (e) {
        yield WatchlistError(e.toString());
      }
    } else if (event is ChangeWatchList) {
      yield WatchlistLoading();
      selected = event.marketWatch;
      try {
        List<ScripModel> scrips =
            await _scripRepository.change(event.marketWatch, this);

        yield WatchlistLoadComplete(allMarketWatch, scrips);
      } catch (e) {
        yield WatchlistError(e.toString());
      }
    } else if (event is Update) {
      yield WatchlistLoading();
      try {
        List<String> scripList = event.marketWatch.scrips!.split(",");
        List<ScripModel> scrips = _scripRepository.scrips;
        List<ScripModel> filtered = [];
        for (String s in scripList) {
          ScripModel scripModel =
              scrips.firstWhere((element) => element.key == s);
          if (!(filtered.any((element) => element.key == scripModel.key))) {
            filtered.add(scripModel);
          }
        }

        yield WatchlistLoadComplete(allMarketWatch, filtered);
      } catch (e) {
        yield WatchlistError(e.toString());
      }
    } else if (event is SearchTextChange) {
      searchbloc.add(SearchChange(event.sSearchText));
    }
  }

  @override
  void response(int stCode, String msg, int responseType,
      [dynamic sub, dynamic data]) {
    //print("RESPONSE");
    print("${DateTime.now()}$stCode $msg $sub  $data");
  }

  @override
  void scripData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues) {
    // print("$key, $exchng, $token,$fieldIndices $fieldValues");
    _scripRepository.updateScrips(key!, fieldIndices, fieldValues);
    add(Update(selected));
  }

  @override
  void depthData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues) {
    print("DEPTH UPDATED");
    ScripModel scripModel =
        _scripRepository.upDateAsDepth(key!, fieldIndices, fieldValues);
    ScripBloc().add(UpdateDepth(scripModel));
    //   print(
    //       '${DateTime.now().toLocal()}::depthData:: key: $key, exchng: $exchng, token: $token, indices: $fieldIndices, values: $fieldValues');
  }

  @override
  void indexData(String? key, String? exchng, String? token,
      List<int?> fieldIndices, List<int?> fieldValues) {
    // print(
    //     '${DateTime.now().toLocal()}::indexData:: key: $key, exchng: $exchng, token: $token, indices: $fieldIndices, values: $fieldValues');
  }
}
