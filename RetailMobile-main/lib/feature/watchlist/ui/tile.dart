import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/common/ui/image/image_widget.dart';
import 'package:tecxlabs_trading_app/common/utils/price_convert.dart';

import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';

class Tile extends StatelessWidget {
  final ScripModel stock;
  const Tile({
    Key? key,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (stock.lastTradePrice == null)
          ? LinearProgressIndicator()
          : Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey, width: 0.2),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 2.9,
                        color: Colors.grey.withOpacity(0.05))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ImageWidget(
                          radius: 23,
                          url: stock.imageUrl!,
                          border: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  stock.name ?? "",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              stock.exchange ?? "EXC",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${PriceConvert.convert(stock.lastTradePrice ?? 0)}",
                          style: TextStyle(
                              color: (stock.change?.isNegative ?? false
                                  ? Colors.red
                                  : Colors.green),
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${PriceConvert.convert(stock.change ?? 0)}(${PriceConvert.convert(stock.percentChange ?? 0)}%)",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
