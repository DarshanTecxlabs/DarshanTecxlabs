import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/common/ui/appbar/appbar.dart';

enum Exchange { NSE, BSE }

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Exchange _exchange = Exchange.NSE;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "HDFC",
        bottom: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.09),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio(
                      value: Exchange.NSE,
                      activeColor: Colors.white,
                      groupValue: _exchange,
                      onChanged: (Exchange? value) {
                        setState(() {
                          _exchange = value!;
                        });
                      },
                    ),
                    Text(
                      "NSE 1200.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: (_exchange == Exchange.NSE)
                              ? FontWeight.w600
                              : FontWeight.normal),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Exchange.BSE,
                      groupValue: _exchange,
                      onChanged: (Exchange? value) {
                        setState(() {
                          _exchange = value!;
                        });
                      },
                    ),
                    Text(
                      "BSE 1200.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: (_exchange == Exchange.BSE)
                              ? FontWeight.w600
                              : FontWeight.normal),
                    ),
                  ],
                ),
              ],
            )),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
