import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/data/ordermodel.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/data/repositories/IOrderbookRepository.dart';
import 'package:tecxlabs_trading_app/feature/orderbook/data/repositories/orderbook_repository.dart';

part 'orderbook_event.dart';
part 'orderbook_state.dart';

class OrderbookBloc extends Bloc<OrderbookEvent, OrderbookState> {
  OrderbookBloc() : super(OrderbookInitial());
  final IOrderBookRepository _orderBookRepository = OrderbookRepository();

  OrderbookState get initialState => OrderbookInitial();

  @override
  Stream<OrderbookState> mapEventToState(OrderbookEvent event) async* {
    List<Ordermodel> allOrders = [];
    if (event is LoadOrderBook) {
      try {
        allOrders = await _orderBookRepository.getAllOrders();
        yield OrderBookLoaded(allOrders);
      } catch (error) {
        yield OrderBookError(error.toString());
      }
    }
  }
}
