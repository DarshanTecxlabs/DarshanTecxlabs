import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tecxlabs_trading_app/common/ui/appbar/appbar.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/positions/bloc/portfolio_bloc.dart';

import 'package:tecxlabs_trading_app/feature/portfolio_page/widgets/details_view_sheet.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/holdings/holdings_page.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/positions/positions_page.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/widgets/quick_view_portfolio.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/bloc/watchlist_bloc.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/ui/bottomsheet.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/ui/tab.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/ui/tile.dart';

import 'holdings/bloc/holdings_bloc.dart';

class PortfolioView extends StatefulWidget {
  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with SingleTickerProviderStateMixin {
  TabController? _tabBarController;
  late PortfolioBloc positionbloc;
  late HoldingsBloc holdingsBloc;

  @override
  void initState() {
    // var state = context.watch()<WatchlistBloc>().state;

    positionbloc = BlocProvider.of<PortfolioBloc>(context);
    positionbloc.add(PortfolioFetchPositions());
    holdingsBloc = BlocProvider.of<HoldingsBloc>(context);
    holdingsBloc.add(PortfolioFetchHoldings());

    super.initState();
    _tabBarController = TabController(vsync: this, length: 2);
  }

  bool tabsInit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          title: 'Portfolio',
          bottom: TabBar(
              isScrollable: true,
             labelPadding: EdgeInsets.symmetric(horizontal: 50),
             indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              labelStyle: TextStyle(fontWeight: FontWeight.w600),
              controller: _tabBarController,
              tabs: [
                BlocBuilder<PortfolioBloc, PortfolioState>(
                  builder: (context, state) {
                    return WatchListTab(
                      'Position',
                      number: positionbloc.positionList?.length.toString(),
                    );
                  },
                ),
                BlocBuilder<HoldingsBloc, HoldingsState>(
                  builder: (context, state) {
                    return WatchListTab(
                      'Holdings',
                      number: holdingsBloc.holdingList?.length.toString(),
                    );
                  },
                )
              ])),
      body: TabBarView(
          controller: _tabBarController, children: [PositionsView(), HoldingsView()]),
    );
  }
}
