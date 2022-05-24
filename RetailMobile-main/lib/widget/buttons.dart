import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';

class ButtonPrimary extends RawMaterialButton {
  ButtonPrimary({
    required String text,
    required Function onPressed,
    required ThemeData themeData,
  }) : super(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: white),
            ),
            onPressed: () {
              onPressed();
            },
            fillColor: themeData.buttonColor);
}
