part of 'create_order_bloc.dart';

abstract class CreateOrderState extends Equatable {
  const CreateOrderState();
  
  @override
  List<Object> get props => [];
}

class CreateOrderInitial extends CreateOrderState {}
