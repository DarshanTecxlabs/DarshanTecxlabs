import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/common/utils/price_convert.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdings_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/position_model.dart';

import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecxlabs_trading_app/util/formatters.dart';

class PositionTile extends StatelessWidget {
  final Position position;
  const PositionTile({
    Key? key,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_quantity(), vSpace(), _name(), vSpace(), _nse()],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [_badge(), vSpace(), _points(), vSpace(), _ltp()],
            ),
          ],
        ));
  }

  _quantity() {
    return Row(
      children: [
        Text(position.tok,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            )),
        hSpace(w: 1.w),
        Text('Qty.',
            style: TextStyle(
              color: textGray,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            )),
      ],
    );
  }

  _name() {
    return Text(position.prod,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ));
  }

  _nse() {
    return Row(
      children: [
        Text(position.exSeg,
            style: TextStyle(
              color: textGray,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            )),
        hSpace(w: 6.w),
        Text('Avg.',
            style: TextStyle(
              color: textGray,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            )),
        Text(position.sellAmt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            )),
      ],
    );
  }

  _badge() {
    return Text('badge',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ));
  }

  _points() {
    return Text(position.cfBuyAmt,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ));
  }

  _ltp() {
    return Row(
      children: [
        Text('LTP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            )),
        hSpace(),
        Text(position.cfBuyAmt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            )),
      ],
    );
  }
}
