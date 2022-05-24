import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tecxlabs_trading_app/common/ui/appbar/appbar.dart';
import 'package:tecxlabs_trading_app/feature/scrip/bloc/scrip_bloc.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/bloc/watchlist_bloc.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/ui/bottomsheet.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/ui/tab.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/ui/tile.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen>
    with SingleTickerProviderStateMixin {
  _showBottomSheet(ScripModel scripModel) async {
    bool? val = await showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      builder: (context) => BottomSheetWidget(
        scripModel: scripModel,
      ),
    );
    if (val ?? true) {
      BlocProvider.of<ScripBloc>(context).add(UnsubscribeDepth(scripModel));
      BlocProvider.of<ScripBloc>(context).close();
    }
  }

  TabController? _tabBarController;

  @override
  void initState() {
    // var state = context.watch()<WatchlistBloc>().state;
    super.initState();
    if (_tabBarController != null) {}
  }

  bool tabsInit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Marketwatch",
        bottom: BlocConsumer<WatchlistBloc, WatchlistState>(
          listener: (context, state) {
            if (state is WatchlistLoadComplete) {
              if (!_tabBarController!.hasListeners) {
                _tabBarController!.addListener(() {
                  BlocProvider.of<WatchlistBloc>(context).add(ChangeWatchList(
                    state.watchlists[_tabBarController!.index],
                  ));
                });
              }
            }
          },
          builder: (context, state) {
            if (state is WatchlistLoaded) {
              _tabBarController =
                  TabController(length: state.watchlists.length, vsync: this);
              BlocProvider.of<WatchlistBloc>(context).add(Loaded());

              return Container();
            } else if (state is WatchlistLoadComplete) {
              if (_tabBarController == null) {
                _tabBarController =
                    TabController(length: state.watchlists.length, vsync: this);
                // BlocProvider.of<WatchlistBloc>(context).add(Loaded());
              }
              return TabBar(
                  onTap: (value) {
                    BlocProvider.of<WatchlistBloc>(context).add(ChangeWatchList(
                      state.watchlists[value],
                    ));
                  },
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
                  labelStyle: TextStyle(fontWeight: FontWeight.w600),
                  controller: _tabBarController,
                  tabs: state.watchlists
                      .map((e) => WatchListTab(
                            e.mwName ?? "",
                          ))
                      .toList());
            }
            return Container();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7.9, vertical: 0),
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
                          hintText: "Search & Add",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (text) {
                          if (text.length > 2) {
                            BlocProvider.of<WatchlistBloc>(context)
                                .add(SearchTextChange(text));
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            FontAwesomeIcons.filter,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: BlocBuilder<WatchlistBloc, WatchlistState>(
                  builder: (context, state) {
                    if (state is WatchlistLoaded) {
                      return CircularProgressIndicator();
                    } else if (state is WatchlistLoadComplete) {
                      if (_tabBarController == null) {
                        _tabBarController = TabController(
                            length: state.watchlists.length, vsync: this);
                        // BlocProvider.of<WatchlistBloc>(context).add(Loaded());
                      }
                      return TabBarView(
                        controller: _tabBarController,
                        children: List.generate(
                          _tabBarController!.length,
                          (index) => Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: SingleChildScrollView(
                              child: Column(
                                children: state.stocks
                                    .map((e) => GestureDetector(
                                        onTap: () {
                                          _showBottomSheet(e);
                                        },
                                        child: Tile(stock: e)))
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is WatchlistError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                  "There was an error while retrieving the data"),
                            ),
                            Button(
                              color: Theme.of(context).primaryColor,
                              text: "RETRY",
                              onPressed: () {
                                BlocProvider.of<WatchlistBloc>(context)
                                    .add(Load());
                              },
                              // onPrwssed: () {
                              //   BlocProvider.of<WatchlistBloc>(context)
                              //       .add(Load());
                              // },
                            )
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  final ScripModel scripModel;
  const BottomSheetWidget({
    Key? key,
    required this.scripModel,
  }) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.28,
        maxChildSize: 0.9,
        minChildSize: 0.28,
        builder: (context, controller) => BlocProvider(
          create: (context) =>
              ScripBloc()..add(SubscribeAsDepth(widget.scripModel)),
          child: BlocBuilder<ScripBloc, ScripState>(
            builder: (context, state) {
              print("Listened");
              if (state is ScripLoaded)
                return QuickView(
                  scripModel: state.scripModel,
                  controller: controller,
                );
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
