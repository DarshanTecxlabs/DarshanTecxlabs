import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecxlabs_trading_app/common/ui/appbar/appbar.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/bloc/orderbook_bloc.dart';

class Orderscreen extends StatefulWidget {
  const Orderscreen({Key? key}) : super(key: key);

  @override
  _OrderscreenState createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderbookBloc, OrderbookState>(
        builder: (context, state) {
      BlocProvider.of<OrderbookBloc>(context).add(LoadOrderBook());
      var orders = [];
      if (state is OrderBookLoaded) {
        orders = (state).lstOrders;
      }
      return Scaffold(
          appBar: GradientAppBar(
            title: "Orderbook",
            bottom: BlocConsumer<OrderbookBloc, OrderbookState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Container();
                }),
          ),
          body: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey, width: 0.2),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 2.9,
                          color: Colors.grey.withOpacity(0.05))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    orders[index].sym,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),                              
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                orders[index].nOrdNo,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                orders[index].qty.toString(),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),                              
                              Text(
                                orders[index].trnsTp,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                orders[index].ordSt,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                orders[index].rejRsn,                                
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                                    maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ));
    });
  }
}
