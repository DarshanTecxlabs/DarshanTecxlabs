part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}



class PortfolioPositionsFailed extends PortfolioState {
  final String failure;

  PortfolioPositionsFailed(this.failure);
   @override
  List<Object> get props => [failure];
  
}

class PortfolioPositionsSuccess extends PortfolioState {
  final List<Position> list;

  PortfolioPositionsSuccess(this.list);
   @override
  List<Object> get props => [list];
  
}

class PortfolioPositionsLoading extends PortfolioState {}