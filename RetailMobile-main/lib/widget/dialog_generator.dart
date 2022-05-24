import 'dart:ui';

import 'package:flutter/material.dart';

class DialogGenerator {
  static make(
      {required BuildContext context,
      required bool barrierDismissible,
      required Widget child}) {
    return showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _dialog(context, child),
                        ],
                      ));
        });
  }

  static Widget _dialog(context, child) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: child,
    );
  }
}
