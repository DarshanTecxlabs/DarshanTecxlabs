part of 'orderbook_bloc.dart';

abstract class OrderbookState extends Equatable {
  const OrderbookState();
  
  @override
  List<Object> get props => [];
}

class OrderbookInitial extends OrderbookState {}
