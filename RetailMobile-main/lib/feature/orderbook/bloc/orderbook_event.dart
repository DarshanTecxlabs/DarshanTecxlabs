part of 'orderbook_bloc.dart';

abstract class OrderbookEvent {}

class LoadOrderBook extends OrderbookEvent {}

class OrderBookLoaded extends OrderbookState {
  final List<Ordermodel> lstOrders;

  OrderBookLoaded(this.lstOrders);
}

class OrderBookError extends OrderbookState {
  final String message;

  OrderBookError(this.message);
}
