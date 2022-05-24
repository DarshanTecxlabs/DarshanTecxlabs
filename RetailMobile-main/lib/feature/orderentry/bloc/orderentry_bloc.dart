import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/bloc/orderentry_event.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/bloc/orderentry_state.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/data/Orderentryresponse.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/data/repository/IOrderEntryRepository.dart';
import 'package:tecxlabs_trading_app/feature/orderentry/data/repository/OrderEntryRepository.dart';

class Orderentrybloc extends Bloc<OrderentryEvent, OrderentryState> {
  Orderentrybloc() : super(Orderentryload());
  final IOrderEntryRequestRepository orderEntryRequestRepository =
      OrderEntryRepository();

  @override
  Stream<OrderentryState> mapEventToState(OrderentryEvent event) async*{
    if (event is Orderentryload) {
    } else if (event is Onorderentryrequest) {
      try {
        Orderentryresponse orderentryresponse = await orderEntryRequestRepository.sendOrderEntry(event.orderentryRequest);
        if(orderentryresponse.stCode == 200)
        {
          yield(Orderentrysuccess(orderentryresponse));          
        }
        else 
        {
          yield(Orderentryfailure(orderentryresponse));          
        }
      } catch (error) {
        yield(Orderentryerror(error.toString()));
      }
    }
  }
}
