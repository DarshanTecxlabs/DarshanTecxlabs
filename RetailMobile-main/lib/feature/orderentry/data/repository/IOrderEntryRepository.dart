import 'package:tecxlabs_trading_app/feature/orderentry/data/Orderentryresponse.dart';
abstract class IOrderEntryRequestRepository {
  Future<Orderentryresponse> sendOrderEntry(dynamic orderentryRequest);
}