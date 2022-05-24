import 'package:tecxlabs_trading_app/feature/orderbook/data/ordermodel.dart';
abstract class IOrderBookRepository {
  Future<List<Ordermodel>> getAllOrders();
}
