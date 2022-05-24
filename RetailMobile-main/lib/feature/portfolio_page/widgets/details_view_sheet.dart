import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/widget/c_text.dart';

import 'package:tecxlabs_trading_app/widget/divider.dart';

class PortfolioDetails extends StatelessWidget {
  final ScrollController controller;

  const PortfolioDetails(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          controller: controller,
          children: [
            Container(),
            divider(),
            _openHigh(),
            divider(),
          ],
        ),
      ),
    );
  }

  _openHigh(){
    return Row(
      children: [
        Expanded(child: Column(
          children: [
            CText('Open')
            // Text()
          ],
        )),
      ],
    );
  }
}
