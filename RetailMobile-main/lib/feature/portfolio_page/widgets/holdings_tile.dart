import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdings_model.dart';
import 'package:tecxlabs_trading_app/util/formatters.dart';
import 'package:tecxlabs_trading_app/widget/c_text.dart';
import 'package:tecxlabs_trading_app/widget/modal_container.dart';

class HoldingsTile extends StatelessWidget {
  final Holding holding;

  const HoldingsTile(this.holding, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_qty(), vSpace(), _name(), vSpace(), _invested()],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [_percent(), vSpace(), _points(), vSpace(), _ltp()],
          )
        ],
      ),
    );
  }

  _qty() {
    return Row(
      children: [
        Text(holding.buyQty,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            )),
        hSpace(w: 1.w),
        Text('Qty.',
            style: TextStyle(
              color: textGray,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            )),
        hSpace(w: 4.w),
        Center(
            child: Container(
          height: 4,
          width: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        )),
        hSpace(w: 4.w),
        Text('Avg.',
            style: TextStyle(
              color: textGray,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            )),
        hSpace(w: 1.w),
        Text(holding.hldQty,
            style: TextStyle(

              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            )),
      ],
    );
  }

  _name() {
    return CText(
      holding.bseTrdSym,
      size: 18.sp,
      isBold: true,
    );
  }

  _invested() {
    return Row(
      children: [
        CText(
          'Invested',
          size: 12.sp,
          isBold: true,
          color: textGray,
        ),
        CText(holding.ltMcxsxcm, size: 12.sp, isBold: true),
      ],
    );
  }

  _percent() {
    return CText(
      holding.ltMcxsxcm,
      size: 12.sp,
    );
  }

  _points() {
    return CText(
      holding.ltMcxsxcm,
      size: 16.sp,
    );
  }

  _ltp() {
    return Row(
      children: [
        CText(
          'LTP',
          size: 14.sp,
          isBold: true,
          color: textGray,
        ),
        hSpace(w: 4.w),
        CText(holding.ltMcxsxcm, size: 14.sp, isBold: true),
        CText(holding.ltMcxsxcm, size: 14.sp, isBold: true),
      ],
    );
  }
}
