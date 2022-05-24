part of 'holdings_bloc.dart';

abstract class HoldingsState extends Equatable {
  const HoldingsState();
  
  @override
  List<Object> get props => [];
}

class HoldingsInitial extends HoldingsState {}

class PortfolioHoldingsFailed extends HoldingsState {
  final String failure;

  PortfolioHoldingsFailed(this.failure);
   @override
  List<Object> get props => [failure];
  
}

class PortfolioHoldingsSuccess extends HoldingsState {
  final List<Holding> list;

  PortfolioHoldingsSuccess(this.list);
   @override
  List<Object> get props => [list];
  
}

class PortfolioHoldingsLoading extends HoldingsState {}
