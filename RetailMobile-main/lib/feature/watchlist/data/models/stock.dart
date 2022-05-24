import 'dart:core';

class ScripModel {
  String? token;
  String? key;
  String? name;
  String? exchange;
  double? price;
  String? imageUrl;
  num? feederFeedTime;
  num? ddsTime;
  num? exchgFeedTime;
  num? lastTradedTime;
  num? tradeVolume;
  num? lastTradePrice;
  num? lastTradeQuantity;
  num? totalBuyQty;
  num? totalSellQty;
  num? bestBidPrice;
  num? bestOfferPrice;
  num? bestBidSize;
  num? bestOfferSize;
  num? avgPrice;
  num? lowPrice;
  num? highPrice;
  num? lowerCircuit;
  num? upperCircuit;
  num? w52WHigh;
  num? w52WLow;
  num? openPrice;
  num? closePrice;
  num? openInterest;
  num? multiplier;
  num? precision;
  num? change;
  num? percentChange;
  num? turnover;
  num? bidPrice1;
  num? bidOrder1;
  num? bidQuantity1;
  num? offerPrice1;
  num? offerOrder1;
  num? offerQuantity1;
  num? bidPrice2;
  num? bidOrder2;
  num? bidQuantity2;
  num? offerPrice2;
  num? offerOrder2;
  num? offerQuantity2;
  num? bidPrice3;
  num? bidOrder3;
  num? bidQuantity3;
  num? offerPrice3;
  num? offerOrder3;
  num? offerQuantity3;
  num? bidPrice4;
  num? bidOrder4;
  num? bidQuantity4;
  num? offerPrice4;
  num? offerOrder4;
  num? offerQuantity4;
  num? bidPrice5;
  num? bidOrder5;
  num? bidQuantity5;
  num? offerPrice5;
  num? offerOrder5;
  num? offerQuantity5;

  ScripModel({
    this.token,
    this.key,
    this.name,
    this.exchange,
    this.price,
    this.change,
    this.imageUrl,
    this.feederFeedTime,
    this.ddsTime,
    this.exchgFeedTime,
    this.lastTradedTime,
    this.tradeVolume,
    this.lastTradePrice,
    this.lastTradeQuantity,
    this.totalBuyQty,
    this.totalSellQty,
    this.bestBidPrice,
    this.bestOfferPrice,
    this.bestBidSize,
    this.bestOfferSize,
    this.avgPrice,
    this.lowPrice,
    this.highPrice,
    this.lowerCircuit,
    this.upperCircuit,
    this.w52WHigh,
    this.w52WLow,
    this.openPrice,
    this.closePrice,
    this.openInterest,
    this.multiplier,
    this.precision,
    this.percentChange,
    this.turnover,
    this.bidPrice1,
    this.bidOrder1,
    this.bidQuantity1,
    this.offerPrice1,
    this.offerOrder1,
    this.offerQuantity1,
    this.bidPrice2,
    this.bidOrder2,
    this.bidQuantity2,
    this.offerPrice2,
    this.offerOrder2,
    this.offerQuantity2,
    this.bidPrice3,
    this.bidOrder3,
    this.bidQuantity3,
    this.offerPrice3,
    this.offerOrder3,
    this.offerQuantity3,
    this.bidPrice4,
    this.bidOrder4,
    this.bidQuantity4,
    this.offerPrice4,
    this.offerOrder4,
    this.offerQuantity4,
    this.bidPrice5,
    this.bidOrder5,
    this.bidQuantity5,
    this.offerPrice5,
    this.offerOrder5,
    this.offerQuantity5,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScripModel &&
        other.token == token &&
        other.key == key &&
        other.name == name &&
        other.exchange == exchange &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.feederFeedTime == feederFeedTime &&
        other.ddsTime == ddsTime &&
        other.exchgFeedTime == exchgFeedTime &&
        other.lastTradedTime == lastTradedTime &&
        other.tradeVolume == tradeVolume &&
        other.lastTradePrice == lastTradePrice &&
        other.lastTradeQuantity == lastTradeQuantity &&
        other.totalBuyQty == totalBuyQty &&
        other.totalSellQty == totalSellQty &&
        other.bestBidPrice == bestBidPrice &&
        other.bestOfferPrice == bestOfferPrice &&
        other.bestBidSize == bestBidSize &&
        other.bestOfferSize == bestOfferSize &&
        other.avgPrice == avgPrice &&
        other.lowPrice == lowPrice &&
        other.highPrice == highPrice &&
        other.lowerCircuit == lowerCircuit &&
        other.upperCircuit == upperCircuit &&
        other.w52WHigh == w52WHigh &&
        other.w52WLow == w52WLow &&
        other.openPrice == openPrice &&
        other.closePrice == closePrice &&
        other.openInterest == openInterest &&
        other.multiplier == multiplier &&
        other.precision == precision &&
        other.change == change &&
        other.percentChange == percentChange &&
        other.turnover == turnover;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        key.hashCode ^
        name.hashCode ^
        exchange.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        feederFeedTime.hashCode ^
        ddsTime.hashCode ^
        exchgFeedTime.hashCode ^
        lastTradedTime.hashCode ^
        tradeVolume.hashCode ^
        lastTradePrice.hashCode ^
        lastTradeQuantity.hashCode ^
        totalBuyQty.hashCode ^
        totalSellQty.hashCode ^
        bestBidPrice.hashCode ^
        bestOfferPrice.hashCode ^
        bestBidSize.hashCode ^
        bestOfferSize.hashCode ^
        avgPrice.hashCode ^
        lowPrice.hashCode ^
        highPrice.hashCode ^
        lowerCircuit.hashCode ^
        upperCircuit.hashCode ^
        w52WHigh.hashCode ^
        w52WLow.hashCode ^
        openPrice.hashCode ^
        closePrice.hashCode ^
        openInterest.hashCode ^
        multiplier.hashCode ^
        precision.hashCode ^
        change.hashCode ^
        percentChange.hashCode ^
        turnover.hashCode;
  }
}
