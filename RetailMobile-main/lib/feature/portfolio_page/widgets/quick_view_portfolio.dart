import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/position_model.dart';
import 'package:tecxlabs_trading_app/util/formatters.dart';
import 'package:tecxlabs_trading_app/widget/c_text.dart';

class QuickViewPortfolio extends StatelessWidget {
  final ScrollController controller;
  final Position model;
  final Function() addButtonPressed;

  const QuickViewPortfolio(this.controller, this.model,
      {Key? key, required this.addButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: Container(
                height: 4.h,
                width: ScreenUtil().setWidth(70),
                decoration: BoxDecoration(
                    color: periwinkle,
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
              ),
            ),
            vSpace(h: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(model.sym, isBold: true, size: 26.sp),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("NSE"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "50.00",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Text("+2.44"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "(1.00%)",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Divider(
                    height: 5,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        this.addButtonPressed();
                      },
                      child: Button(
                        text: "ADD",
                        color: addBlue,
                      ),
                    ),
                    Button(
                      text: "EXIT",
                      color: exitRed,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "View charts and Graph",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1000,
                ),
              ],
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
  final Function? onPressed;

  const Button(
      {Key? key, this.text = "", this.color = Colors.red, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: ScreenUtil().setHeight(65),
        width: MediaQuery.of(context).size.width / 2.8,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
