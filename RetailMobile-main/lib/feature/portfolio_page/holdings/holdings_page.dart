import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/widgets/holdings_tile.dart';
import 'package:tecxlabs_trading_app/util/formatters.dart';
import 'package:tecxlabs_trading_app/widget/c_text.dart';
import 'package:tecxlabs_trading_app/widget/divider.dart';
import 'package:tecxlabs_trading_app/widget/modal_container.dart';

import 'bloc/holdings_bloc.dart';

class HoldingsView extends StatefulWidget {
  @override
  _HoldingsViewState createState() => _HoldingsViewState();
}

class _HoldingsViewState extends State<HoldingsView> {
  late HoldingsBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<HoldingsBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HoldingsBloc, HoldingsState>(
      buildWhen: (_, s) => (s is PortfolioHoldingsSuccess ||
          s is PortfolioHoldingsFailed ||
          s is PortfolioHoldingsLoading),
      builder: (context, state) {
        if (state is PortfolioHoldingsFailed) {
          return Center(
            child: Text(
              state.failure,
              style: TextStyle(color: textGray, fontSize: 22.sp),
            ),
          );
        } else if (state is PortfolioHoldingsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return bloc.holdingList != null ? _body() : Container();
        // return Container();
      },
    );
  }

  _body() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [_hud(), _search(), _list()],
      ),
    );
  }

  _hud() {
    return CContainer(
      child: Column(

          children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    'Invested',
                    size: 16.sp,
                    color: textGray,
                  ),
                  vSpace(h: 5.h),
                  CText(
                    '8700',
                    isBold:true,
                    size: 25.sp,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    'Current',
                    size: 16.sp,
                    color: textGray,
                  ),
                  vSpace(h: 5.h),
                  CText(
                    '870,000',
                    isBold:true,
                    size: 25.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
        divider(),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    'P&L',
                    size: 22.sp,
                    color: textGray,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CText(
                    '+329387',
                    isBold:true,
                    size: 25.sp,
                  ),
                  CText(
                    '+89',
                    isBold:true,
                    size: 16.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  _search() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 0.2),
          boxShadow: [
            BoxShadow(blurRadius: 4, spreadRadius: 2.9, color: Colors.grey.withOpacity(0.05))
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.9, vertical: 0),
            child: Icon(
              FontAwesomeIcons.search,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.57,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Icon(
                FontAwesomeIcons.filter,
                color: Theme.of(context).primaryColor,
              )),
        ],
      ),
    );
  }

  _list() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: bloc.holdingList!.length,
        itemBuilder: (_, index) {
          return HoldingsTile(bloc.holdingList![index]);
        });
  }
}
