import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tecxlabs_trading_app/common/colors.dart';
import 'package:tecxlabs_trading_app/common/ui/image/image_widget.dart';
import 'package:tecxlabs_trading_app/common/utils/price_convert.dart';
import 'package:tecxlabs_trading_app/feature/scrip/bloc/scrip_bloc.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';
import 'package:tecxlabs_trading_app/util/app_router.dart';

class QuickView extends StatelessWidget {
  final ScrollController controller;
  final ScripModel scripModel;

  QuickView({
    Key? key,
    required this.controller,
    required this.scripModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buyStyle = TextStyle(color: buyButtonColor);
    var sellStyle = TextStyle(color: sellButtonColor);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 7, bottom: 15),
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ImageWidget(
                      url: scripModel.imageUrl!,
                      radius: 20,
                      border: 1,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          scripModel.name!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  scripModel.exchange!,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    "${PriceConvert.convert(scripModel.lastTradePrice ?? 0)}",
                                    style: TextStyle(
                                        color: (scripModel.change!.isNegative)
                                            ? Colors.red
                                            : Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                    "${!(scripModel.percentChange?.isNegative ?? false) ? "+" : ""} ${PriceConvert.convert(scripModel.change ?? 0)}"),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  "(${!(scripModel.percentChange?.isNegative ?? false) ? "+" : ""} ${PriceConvert.convert(scripModel.percentChange ?? 0)}%)",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  height: 10,
                  // color: Theme.of(context).primaryColor,
                ),
              ),
              Row(
                children: [
                  Button(
                    text: "BUY",
                    color: buyButtonColor,
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.createOrder);
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  Button(
                    text: "SELL",
                    color: sellButtonColor,
                  ),
                ],
              ),
              // Padding(
              // padding: const EdgeInsets.all(10.0),
              // child:
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconAndText(
                      icon: Icons.graphic_eq,
                      text: "View Chart",
                    ),
                    IconAndText(
                      icon: Icons.graphic_eq,
                      text: "Open Chain",
                    ),
                    IconAndText(
                      icon: Icons.graphic_eq,
                      text: "Create GTT",
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DepthElement(
                          textStyle:
                              buyStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Bid",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value:
                              "${PriceConvert.convert(scripModel.bidPrice1 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value:
                              "${PriceConvert.convert(scripModel.bidPrice2 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value:
                              "${PriceConvert.convert(scripModel.bidPrice3 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value:
                              "${PriceConvert.convert(scripModel.bidPrice4 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value:
                              "${PriceConvert.convert(scripModel.bidPrice5 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle:
                              buyStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Total",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DepthElement(
                          textStyle:
                              buyStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Orders",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidOrder1 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidOrder2 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidOrder3 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidOrder4 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidOrder5 ?? 0}",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DepthElement(
                          textStyle:
                              buyStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Qty",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidQuantity1 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidQuantity2 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidQuantity3 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidQuantity4 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: buyStyle,
                          value: "${scripModel.bidQuantity5 ?? 0}",
                        ),
                        DepthElement(
                          textStyle:
                              buyStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "120",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DepthElement(
                          textStyle:
                              sellStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Offer",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value:
                              "${PriceConvert.convert(scripModel.offerPrice1 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value:
                              "${PriceConvert.convert(scripModel.offerPrice2 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value:
                              "${PriceConvert.convert(scripModel.offerPrice3 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value:
                              "${PriceConvert.convert(scripModel.offerPrice4 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value:
                              "${PriceConvert.convert(scripModel.offerPrice5 ?? 0)}",
                        ),
                        DepthElement(
                          textStyle:
                              sellStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Total",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DepthElement(
                          textStyle:
                              sellStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Orders",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerOrder1 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerOrder2 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerOrder3 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerOrder4 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerOrder5 ?? 0}",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DepthElement(
                          textStyle:
                              sellStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "Qty",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerQuantity1 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerQuantity2 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerQuantity3 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerQuantity4 ?? 0}",
                        ),
                        DepthElement(
                          textStyle: sellStyle,
                          value: "${scripModel.offerQuantity5 ?? 0}",
                        ),
                        DepthElement(
                          textStyle:
                              sellStyle.copyWith(fontWeight: FontWeight.bold),
                          value: "120",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  height: 10,
                  // color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceWidget(
                      price:
                          "${PriceConvert.convert(scripModel.openPrice ?? 0)}",
                      text: "Open",
                    ),
                    PriceWidget(
                      price:
                          "${PriceConvert.convert(scripModel.highPrice ?? 0)}",
                      text: "High",
                    ),
                    PriceWidget(
                      price:
                          "${PriceConvert.convert(scripModel.lowPrice ?? 0)}",
                      text: "Low",
                    ),
                    PriceWidget(
                      price:
                          "${PriceConvert.convert(scripModel.closePrice ?? 0)}",
                      text: "Prev. close",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 5,
                ),
              ),
              DetailWidget(
                title: "Volume",
                value: "0",
              ),
              DetailWidget(
                title: "Avg. trade price",
                value: "${PriceConvert.convert(scripModel.avgPrice ?? 0)}",
              ),
              DetailWidget(
                title: "Last trade quantity",
                value: "${scripModel.lastTradeQuantity}",
              ),
              DetailWidget(
                title: "Last traded at",
                value: "2021-09-23 15:38:44",
              ),
              DetailWidget(
                title: "Lower circuit",
                value: "${PriceConvert.convert(scripModel.lowerCircuit ?? 0)}",
              ),
              DetailWidget(
                title: "Upper circuit",
                value: "${PriceConvert.convert(scripModel.upperCircuit ?? 0)}",
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class DepthElement extends StatelessWidget {
  const DepthElement({
    Key? key,
    required this.textStyle,
    required this.value,
  }) : super(key: key);

  final TextStyle textStyle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        value,
        style: textStyle,
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String title, value;

  const DetailWidget({Key? key, required this.title, required this.value})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final String text;
  final String price;
  const PriceWidget({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class DepthWidget extends StatelessWidget {
  DepthWidget({Key? key, required this.style, this.isBuy = true})
      : super(key: key);

  final TextStyle style;
  final bool isBuy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              child: Text(
                "Bid",
                style: style,
              ),
            ),
            Container(
              width: 50,
              child: Text(
                "Orders",
                style: style,
              ),
            ),
            Container(
              width: 50,
              child: Text(
                "Qty",
                style: style,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                  Text(
                    "0",
                    style: style,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconAndText({Key? key, required this.text, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 16,
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                    // color: Theme.of(context).primaryColor
                    // ,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;

  const Button(
      {Key? key, this.text = "", this.color = Colors.red, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // padding: const EdgeInsets.all(10),
        // margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        width: MediaQuery.of(context).size.width / 2.8,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
