import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tecxlabs_trading_app/common/utils/colors.dart';

import 'package:tecxlabs_trading_app/feature/portfolio_page/positions/bloc/portfolio_bloc.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/position_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/widgets/details_view_sheet.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/widgets/position_popup.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/widgets/position_tile.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/widgets/quick_view_portfolio.dart';
import 'package:tecxlabs_trading_app/widget/dialog_generator.dart';

class PositionsView extends StatefulWidget {
  const PositionsView({Key? key}) : super(key: key);

  @override
  _PositionsViewState createState() => _PositionsViewState();
}

class _PositionsViewState extends State<PositionsView> {
  late PortfolioBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<PortfolioBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      buildWhen: (_, s) => (s is PortfolioPositionsSuccess ||
          s is PortfolioPositionsFailed ||
          s is PortfolioPositionsLoading),
      builder: (context, state) {
        if (state is PortfolioPositionsFailed) {
          return Center(
            child: Text(
              state.failure,
              style: TextStyle(color: textGray, fontSize: 22.sp),
            ),
          );
        } else if (state is PortfolioPositionsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return bloc.positionList != null ? _body() : Container();
      },
    );
  }

  _body() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(

        children: [_hud(), _searchBar(), _listView()],
      ),
    );
  }

  _listView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: bloc.positionList!.length,
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                _showBottomSheet(bloc.positionList![index]);
                // _generateDialog();
              },
              child: PositionTile(position: bloc.positionList![index]));
        });
  }

  _hud() {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 0.2),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 2.9,
                color: Colors.grey.withOpacity(0.05))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    bloc.add(PortfolioFetchPositions());
                  },
                  child: Text(
                    'Total P&L',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('-73',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp))
              ],
            ),
            Row(
              children: [
                Text('M2M',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.sp)),
                SizedBox(
                  width: 10,
                ),
                Text('-01.5',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  _searchBar() {
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
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 2.9,
                color: Colors.grey.withOpacity(0.05))
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

  _generateDialog() {
    DialogGenerator.make(
        context: context, barrierDismissible: true, child: PositionPopup());
  }

  _showBottomSheet(Position position) {
    return showModalBottomSheet(
        context: context,
        enableDrag: false,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.55,
                maxChildSize: 0.55,
                minChildSize: 0.55,
                builder: (context, controller) => QuickViewPortfolio(
                        controller, position, addButtonPressed: () {
                      Navigator.pop(context);
                      _detailsSheet();
                    }))));
  }

  _detailsSheet() {
    return showModalBottomSheet(
        context: context,
        enableDrag: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.8,
                maxChildSize: 0.8,
                minChildSize: 0.3,
                builder: (context, controller) =>
                    PortfolioDetails(controller))));
  }
}
