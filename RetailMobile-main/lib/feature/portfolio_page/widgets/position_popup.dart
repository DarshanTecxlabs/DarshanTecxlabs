import 'package:flutter/material.dart';

import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/util/formatters.dart';
import 'package:tecxlabs_trading_app/widget/c_text.dart';

class PositionPopup extends StatefulWidget {
  const PositionPopup({Key? key}) : super(key: key);

  @override
  _PositionPopupState createState() => _PositionPopupState();
}

class _PositionPopupState extends State<PositionPopup> {
  int radio = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey, width: 0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          _convert(),
          _radio(),
        ],
      ),
    );
  }

  _radio() {
    return Row(
      children: [
        Radio(
          value: radio,
          activeColor: periwinkle,
          groupValue: 0,
          onChanged: (i) {
            setState(() {
              // radio = i;
            });
          },
        ),
        CText(
          'Day',
          size: 14,
        ),
        Radio(
          activeColor: periwinkle,
          value: radio,
          groupValue: 0,
          onChanged: (i) {
            setState(() {});
          },
        ),
        CText('Overnight', size: 14),
      ],
    );
  }

  _header() {
    return CText(
      'HDFC',
      size: 20,
    );
  }

  _convert() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            hSpace(),
            Expanded(
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.arrow_right_alt_outlined,
                  )),
            ),
            hSpace(),
            Expanded(
              child: Container(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
