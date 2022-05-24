import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';

class WatchListTab extends StatelessWidget {
  final String name;
  final String? number;

  const WatchListTab(this.name, {this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          number != null
              ? SizedBox(
                  width: 3,
                )
              : Container(),
          number != null ? _numberCircle() : Container()
        ],
      ),
    );
  }

  _numberCircle() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Center(
        child: Text(
          number!,
          style: TextStyle(
            color: periwinkle,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
