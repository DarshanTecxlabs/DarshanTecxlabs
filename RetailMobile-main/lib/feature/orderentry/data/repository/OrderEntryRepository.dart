import 'dart:convert';
import 'package:tecxlabs_trading_app/common/data/models/api_response.dart';
import 'package:tecxlabs_trading_app/common/network/executer.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/data/OrderentryRequest.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/data/Orderentryresponse.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/data/repository/IOrderEntryRepository.dart';

class OrderEntryRepository implements IOrderEntryRequestRepository {
  Executer _executer = Executer();

  @override
  Future<Orderentryresponse> sendOrderEntry(dynamic orderentryRequest) async {
    Orderentryresponse orderentryresponse = Orderentryresponse();
    try {
      String jsonResponse = await _executer.sendOrderEntryRequest(orderentryRequest);
      final response = ApiResponse.fromJson(jsonDecode(jsonResponse));
      if (response.code == 200) {        
          orderentryresponse = Orderentryresponse.fromJson(response.data);        
      }
    } catch (error) {
      print(error.toString());
      orderentryresponse = Orderentryresponse(stCode: 400,comment: "Error",nOrdNo: "0");
    }
    return orderentryresponse;
  }
}
