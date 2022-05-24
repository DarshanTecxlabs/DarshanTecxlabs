part of 'holdings_bloc.dart';

abstract class HoldingsEvent extends Equatable {
  const HoldingsEvent();

  @override
  List<Object> get props => [];
}

class PortfolioFetchHoldings extends HoldingsEvent {}
