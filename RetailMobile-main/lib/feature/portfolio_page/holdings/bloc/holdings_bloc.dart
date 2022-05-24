import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/models/holdings_model.dart';
import 'package:tecxlabs_trading_app/feature/portfolio_page/data/repositories/portfolio_repository.dart';

part 'holdings_event.dart';
part 'holdings_state.dart';

class HoldingsBloc extends Bloc<HoldingsEvent, HoldingsState> {
  PortfolioRepo repo;
  HoldingsBloc({required this.repo}) : super(HoldingsInitial());

  List<Holding>? holdingList;

  @override
  Stream<HoldingsState> mapEventToState(
    HoldingsEvent event,
  ) async* {
    if (event is PortfolioFetchHoldings) {
      yield PortfolioHoldingsLoading();

      var response = await repo.getAllHoldings();

      yield* response.fold((failure) async* {
        print('bloc: ' + failure);
        yield PortfolioHoldingsFailed(failure);
      }, (result) async* {
        print('bloc: ' + result.length.toString());
        holdingList = result;
        yield PortfolioHoldingsSuccess(result);
      });
    }
  }
}
