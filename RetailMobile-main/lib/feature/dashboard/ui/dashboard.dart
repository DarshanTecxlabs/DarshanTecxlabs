import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/ui/orderbook.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/portfolio_view.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/ui/watchlist.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> pages = [
    WatchListScreen(),
    PortfolioView(),
    Orderscreen(),
    WatchListScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: pages[selectedIndex],
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          color: Colors.transparent,
          height: 85,
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navItem(label: "Watchlist", icon: FontAwesomeIcons.eye, index: 0),
              navItem(
                  label: "Portfolio",
                  icon: FontAwesomeIcons.chartPie,
                  index: 1),
              navItem(
                  label: "Orders",
                  icon: FontAwesomeIcons.sellsy,
                  index: 2,
                  isOrder: true),
              navItem(label: "Social", icon: FontAwesomeIcons.qrcode, index: 3),
              navItem(
                  label: "Investment",
                  icon: FontAwesomeIcons.warehouse,
                  index: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(
      {IconData icon = Icons.watch,
      String label = "Watchlist",
      bool isOrder = false,
      required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
            left: 14, right: 14, bottom: (isOrder) ? 6 : 3, top: 5),

        // width: 50,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              if (isOrder)
                BoxShadow(
                    spreadRadius: 1.2,
                    blurRadius: 10.0,
                    // offset: Offset.fromDirection(0.7, 2.0),
                    // color: Colors.black),
                    color: Colors.grey.withOpacity(0.5))
            ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Icon(
            icon,
            color: (selectedIndex == index)
                ? Theme.of(context).primaryColor
                : Colors.grey,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              label,
              style: TextStyle(
                  color: (selectedIndex == index)
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  fontSize: 11),
            ),
          ),
        ]),
      ),
    );
  }
}
