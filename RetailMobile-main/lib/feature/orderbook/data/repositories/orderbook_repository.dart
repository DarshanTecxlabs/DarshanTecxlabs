import 'dart:convert';

import 'package:tecxlabs_trading_app/common/data/models/interactive_api_response.dart';
import 'package:tecxlabs_trading_app/common/network/executer.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/data/ordermodel.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/data/repositories/IOrderbookRepository.dart';

class OrderbookRepository implements IOrderBookRepository{
  final Executer _executer = Executer();  
  @override
  Future<List<Ordermodel>> getAllOrders() async {
   List<Ordermodel> lstOrders = [];
    try {
      String jsonResponse = await _executer.getOrders();
      final response = InteractiveAPIResponse.fromJson(jsonDecode(jsonResponse));
      if (response.stCode == 200) {
        if (response.data is List) {
          response.data.forEach((e) {
            lstOrders.add(Ordermodel.fromJson(e));
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return lstOrders;
  }
}