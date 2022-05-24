import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/common/data/models/mpin_response.dart';
import 'package:tecxlabs_trading_app/common/utils/const.dart';
import 'package:tecxlabs_trading_app/repository/user_repository.dart';

part 'mpin_event.dart';

part 'mpin_state.dart';

class MpinBloc extends Bloc<MpinEvent, MpinState> {
  final UserRepositories userRepositories;
  late String sSessionKey;
  //
  MpinBloc({required this.userRepositories}) : super(MpinInitial());

  @override
  Stream<MpinState> mapEventToState(
    MpinEvent event,
  ) async* {
    if (event is MpinButtonPressed) {
      yield MpinLoading();

      try {
        MpinResponse mpinResponse = await userRepositories.mpin(
            event.uid,
            event.mpin,
            event.brokerId,
            event.devicempinkey,
            event.deviceInfo,
            event.source,
            event.deviceName,
            event.buildNumber);
        this.sSessionKey = mpinResponse.data.sessionKey;
        removeSessionValue();
        saveSessionValue(mpinResponse.data.sessionKey);
        yield MpinSuccess(mpinResponse);
      } catch (error) {
        MpinFailure(error: error.toString());
      }
    }
  }

  String getSessionKey() {
    return this.sSessionKey;
  }
}
