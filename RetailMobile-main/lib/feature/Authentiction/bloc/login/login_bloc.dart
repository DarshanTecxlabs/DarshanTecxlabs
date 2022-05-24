import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/bloc/authentication/auth.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/bloc/authentication/auth_bloc.dart';
import 'package:tecxlabs_trading_app/common/data/models/login_response.dart';
import 'package:tecxlabs_trading_app/repository/user_repository.dart';
part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepositories userRepositories;
  final AuthenticationBloc authenticationBloc;
  late LoginResponse loginResponse;
  late String sUID;
  //
  LoginBloc({
    required this.userRepositories,
    required this.authenticationBloc,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        LoginResponse loginResponse = await userRepositories.login(
            event.uid,
            event.pwd,
            event.brokerId,
            event.deviceInfo,
            event.source,
            event.deviceName,
            event.buildNumber);
        authenticationBloc.add(LoggedIn(token: loginResponse));
        this.loginResponse = loginResponse;
        this.sUID = event.uid;
        yield LoginSuccess(loginResponse);
        //yield LoginInitial();
      } catch (error) {
        LoginFailure(error: error.toString());
      }
    }
  }

  LoginResponse getloginResponse() {
    return this.loginResponse;
  }

  String getUID() {
    return this.sUID;
  }
}
