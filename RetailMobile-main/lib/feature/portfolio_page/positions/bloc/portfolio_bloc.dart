import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdings_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/position_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/repositories/i_portfolio_repository.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/repositories/portfolio_repository.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioRepo repo;
  PortfolioBloc({required this.repo}) : super(PortfolioInitial());
  
  List<Position>? positionList;

  @override
  Stream<PortfolioState> mapEventToState(
    PortfolioEvent event,
  ) async* {
    

     if (event is PortfolioFetchPositions) {
      yield PortfolioPositionsLoading();

      var response = await repo.getAllPositions();

      yield* response.fold((failure) async* {
        print('bloc: ' + failure);
        yield PortfolioPositionsFailed(failure);
      }, (result) async* {
        print('bloc: ' + result.length.toString());
        positionList = result;
        yield PortfolioPositionsSuccess(result);
      });
    }

    
  }
}
