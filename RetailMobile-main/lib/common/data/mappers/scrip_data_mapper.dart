import 'package:tecxlabs_trading_app/common/data/models/scrip_data.dart';
import 'package:tecxlabs_trading_app/common/utils/const.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';

class ScripDataMapper {
  static ScripModel map(ScripData data) {
    return ScripModel(
      name: data.cmpName,
      key: "${data.exSeg}|${data.tok}",
      exchange: data.exch,
      imageUrl: ((MARKETWATCH_ITEM_IMAGE_BASE_PATH) + "${data.isin}" + ".png"),
    );
  }

  static ScripModel update(ScripModel initial, String key,
      List<int?> fieldIndices, List<int?> fieldValues) {
    ScripModel model = initial;

    if (fieldIndices.contains(0)) {
      int index = fieldIndices.indexOf(0);
      model.feederFeedTime = fieldValues[index];
    }
    if (fieldIndices.contains(1)) {
      int index = fieldIndices.indexOf(1);
      model.ddsTime = fieldValues[index];
    }
    if (fieldIndices.contains(2)) {
      int index = fieldIndices.indexOf(2);
      model.exchgFeedTime = fieldValues[index];
    }
    if (fieldIndices.contains(3)) {
      int index = fieldIndices.indexOf(3);
      model.lastTradedTime = fieldValues[index];
    }
    if (fieldIndices.contains(4)) {
      int index = fieldIndices.indexOf(4);
      model.tradeVolume = fieldValues[index];
    }
    if (fieldIndices.contains(5)) {
      int index = fieldIndices.indexOf(5);
      model.lastTradePrice = fieldValues[index];
    }
    if (fieldIndices.contains(6)) {
      int index = fieldIndices.indexOf(6);
      model.lastTradeQuantity = fieldValues[index];
    }
    if (fieldIndices.contains(7)) {
      int index = fieldIndices.indexOf(7);
      model.totalBuyQty = fieldValues[index];
    }
    if (fieldIndices.contains(8)) {
      int index = fieldIndices.indexOf(8);
      model.totalSellQty = fieldValues[index];
    }
    if (fieldIndices.contains(9)) {
      int index = fieldIndices.indexOf(9);
      model.bestBidPrice = fieldValues[index];
    }
    if (fieldIndices.contains(10)) {
      int index = fieldIndices.indexOf(10);
      model.bestOfferPrice = fieldValues[index];
    }
    if (fieldIndices.contains(11)) {
      int index = fieldIndices.indexOf(11);
      model.bestBidSize = fieldValues[index];
    }
    if (fieldIndices.contains(12)) {
      int index = fieldIndices.indexOf(12);
      model.bestOfferSize = fieldValues[index];
    }
    if (fieldIndices.contains(13)) {
      int index = fieldIndices.indexOf(13);
      model.avgPrice = fieldValues[index];
    }
    if (fieldIndices.contains(14)) {
      int index = fieldIndices.indexOf(14);
      model.lowPrice = fieldValues[index];
    }
    if (fieldIndices.contains(15)) {
      int index = fieldIndices.indexOf(15);
      model.highPrice = fieldValues[index];
    }
    if (fieldIndices.contains(16)) {
      int index = fieldIndices.indexOf(16);
      model.lowerCircuit = fieldValues[index];
    }
    if (fieldIndices.contains(17)) {
      int index = fieldIndices.indexOf(17);
      model.upperCircuit = fieldValues[index];
    }
    if (fieldIndices.contains(18)) {
      int index = fieldIndices.indexOf(18);
      model.w52WHigh = fieldValues[index];
    }
    if (fieldIndices.contains(19)) {
      int index = fieldIndices.indexOf(19);
      model.w52WLow = fieldValues[index];
    }
    if (fieldIndices.contains(20)) {
      int index = fieldIndices.indexOf(20);
      model.openPrice = fieldValues[index];
    }
    if (fieldIndices.contains(21)) {
      int index = fieldIndices.indexOf(21);
      model.closePrice = fieldValues[index];
    }
    if (fieldIndices.contains(22)) {
      int index = fieldIndices.indexOf(22);
      model.openInterest = fieldValues[index];
    }
    if (fieldIndices.contains(23)) {
      int index = fieldIndices.indexOf(23);
      model.multiplier = fieldValues[index];
    }
    if (fieldIndices.contains(24)) {
      int index = fieldIndices.indexOf(24);
      model.precision = fieldValues[index];
    }
    if (fieldIndices.contains(25)) {
      int index = fieldIndices.indexOf(25);
      model.change = fieldValues[index];
    }
    if (fieldIndices.contains(26)) {
      int index = fieldIndices.indexOf(26);
      model.percentChange = fieldValues[index];
    }
    if (fieldIndices.contains(27)) {
      int index = fieldIndices.indexOf(27);
      model.turnover = fieldValues[index];
    }

    return model;
  }

  static ScripModel mapDepth(ScripModel model, String key,
      List<int?> fieldIndices, List<int?> fieldValues) {
    if (fieldIndices.contains(0)) {
      int index = fieldIndices.indexOf(0);
      model.feederFeedTime = fieldValues[index];
    }
    if (fieldIndices.contains(1)) {
      int index = fieldIndices.indexOf(1);
      model.ddsTime = fieldValues[index];
    }
    if (fieldIndices.contains(2)) {
      int index = fieldIndices.indexOf(2);
      model.bidPrice1 = fieldValues[index];
    }
    if (fieldIndices.contains(3)) {
      int index = fieldIndices.indexOf(3);
      model.bidPrice2 = fieldValues[index];
    }
    if (fieldIndices.contains(4)) {
      int index = fieldIndices.indexOf(4);
      model.bidPrice3 = fieldValues[index];
    }
    if (fieldIndices.contains(5)) {
      int index = fieldIndices.indexOf(5);
      model.bidPrice4 = fieldValues[index];
    }
    if (fieldIndices.contains(6)) {
      int index = fieldIndices.indexOf(6);
      model.bidPrice5 = fieldValues[index];
    }
    if (fieldIndices.contains(7)) {
      int index = fieldIndices.indexOf(7);
      model.offerPrice1 = fieldValues[index];
    }
    if (fieldIndices.contains(8)) {
      int index = fieldIndices.indexOf(8);
      model.offerPrice2 = fieldValues[index];
    }
    if (fieldIndices.contains(9)) {
      int index = fieldIndices.indexOf(9);
      model.offerPrice3 = fieldValues[index];
    }
    if (fieldIndices.contains(10)) {
      int index = fieldIndices.indexOf(10);
      model.offerPrice4 = fieldValues[index];
    }
    if (fieldIndices.contains(11)) {
      int index = fieldIndices.indexOf(11);
      model.offerPrice5 = fieldValues[index];
    }
    if (fieldIndices.contains(12)) {
      int index = fieldIndices.indexOf(12);
      model.bidQuantity1 = fieldValues[index];
    }
    if (fieldIndices.contains(13)) {
      int index = fieldIndices.indexOf(13);
      model.bidQuantity2 = fieldValues[index];
    }
    if (fieldIndices.contains(14)) {
      int index = fieldIndices.indexOf(14);
      model.bidQuantity3 = fieldValues[index];
    }
    if (fieldIndices.contains(15)) {
      int index = fieldIndices.indexOf(15);
      model.bidQuantity4 = fieldValues[index];
    }
    if (fieldIndices.contains(16)) {
      int index = fieldIndices.indexOf(16);
      model.bidQuantity5 = fieldValues[index];
    }
    if (fieldIndices.contains(17)) {
      int index = fieldIndices.indexOf(17);
      model.offerQuantity1 = fieldValues[index];
    }
    if (fieldIndices.contains(18)) {
      int index = fieldIndices.indexOf(18);
      model.offerQuantity2 = fieldValues[index];
    }
    if (fieldIndices.contains(19)) {
      int index = fieldIndices.indexOf(19);
      model.offerQuantity3 = fieldValues[index];
    }
    if (fieldIndices.contains(20)) {
      int index = fieldIndices.indexOf(20);
      model.offerQuantity4 = fieldValues[index];
    }
    if (fieldIndices.contains(21)) {
      int index = fieldIndices.indexOf(21);
      model.offerQuantity5 = fieldValues[index];
    }
    if (fieldIndices.contains(22)) {
      int index = fieldIndices.indexOf(22);
      model.bidOrder1 = fieldValues[index];
    }
    if (fieldIndices.contains(23)) {
      int index = fieldIndices.indexOf(23);
      model.bidOrder2 = fieldValues[index];
    }
    if (fieldIndices.contains(24)) {
      int index = fieldIndices.indexOf(24);
      model.bidOrder3 = fieldValues[index];
    }
    if (fieldIndices.contains(25)) {
      int index = fieldIndices.indexOf(25);
      model.bidOrder4 = fieldValues[index];
    }
    if (fieldIndices.contains(26)) {
      int index = fieldIndices.indexOf(26);
      model.bidOrder5 = fieldValues[index];
    }
    if (fieldIndices.contains(27)) {
      int index = fieldIndices.indexOf(27);
      model.offerOrder1 = fieldValues[index];
    }
    if (fieldIndices.contains(28)) {
      int index = fieldIndices.indexOf(28);
      model.offerOrder2 = fieldValues[index];
    }
    if (fieldIndices.contains(29)) {
      int index = fieldIndices.indexOf(29);
      model.offerOrder3 = fieldValues[index];
    }
    if (fieldIndices.contains(30)) {
      int index = fieldIndices.indexOf(30);
      model.offerOrder4 = fieldValues[index];
    }
    if (fieldIndices.contains(31)) {
      int index = fieldIndices.indexOf(31);
      model.offerOrder5 = fieldValues[index];
    }
    if (fieldIndices.contains(31)) {
      int index = fieldIndices.indexOf(31);
      model.offerOrder5 = fieldValues[index];
    }
    if (fieldIndices.contains(32)) {
      int index = fieldIndices.indexOf(32);
      model.multiplier = fieldValues[index];
    }
    if (fieldIndices.contains(33)) {
      int index = fieldIndices.indexOf(33);
      model.precision = fieldValues[index];
    }
    return model;
  }
}
