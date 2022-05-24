import 'package:tecxlabs_trading_app/feature/orderentry/data/Orderentryresponse.dart';

abstract class OrderentryState{}

class Orderentryload extends OrderentryState{}

class Orderentrysuccess extends OrderentryState{
  final Orderentryresponse orderentryresponse;

  Orderentrysuccess(this.orderentryresponse);
}

class Orderentryfailure extends OrderentryState{
  final Orderentryresponse orderentryresponse;

  Orderentryfailure(this.orderentryresponse);
}

class Orderentryerror extends OrderentryState{
  final String sErrorString;

  Orderentryerror(this.sErrorString);
}