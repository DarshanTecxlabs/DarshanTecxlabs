
import 'package:tecxlabs_trading_app/feature/orderentry/data/OrderentryRequest.dart';

abstract class OrderentryEvent {}
class Onorderentryload extends OrderentryEvent{}

class Onorderentryrequest extends OrderentryEvent {
  final OrderentryRequest orderentryRequest;

  Onorderentryrequest(this.orderentryRequest);
}