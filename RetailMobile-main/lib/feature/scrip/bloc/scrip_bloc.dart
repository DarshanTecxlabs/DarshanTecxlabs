import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/models/stock.dart';
import 'package:tecxlabs_trading_app/feature/watchlist/data/repoitories/i_stock_repository.dart';

import '../../../inject.dart';

part 'scrip_event.dart';
part 'scrip_state.dart';

class ScripBloc extends Bloc<ScripEvent, ScripState> {
  ScripBloc() : super(ScripInitial());
  final IScripRepository _scripRepository = getIt<IScripRepository>();
  ScripModel scripSelected = ScripModel();
  @override
  Stream<ScripState> mapEventToState(
    ScripEvent event,
  ) async* {
    if (event is SubscribeAsDepth) {
      yield ScripInitial();
      scripSelected =
          await _scripRepository.subscribeAsDepth(event.scripModel.key!);
      yield ScripLoaded(scripSelected);
    } else if (event is UpdateDepth) {
      yield ScripInitial();
      // if (scripSelected.key == event.scripModel.key) {
      print("/ Log");
      yield ScripLoaded(event.scripModel);
      // }
    }

    if (event is UnsubscribeDepth) {
      _scripRepository.unsubscribeAsDepth(event.scripModel.key!);
      yield ScripInitial();
    }
  }
}
