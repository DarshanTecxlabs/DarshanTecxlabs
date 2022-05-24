import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecxlabs_trading_app/common/data/models/forgot_password_response.dart';
import 'package:tecxlabs_trading_app/repository/user_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  //
  final UserRepositories userRepositories;
  //
  ForgotPasswordBloc({
    required this.userRepositories,
  }) : super(ForgotPasswordInitial());

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is SubmitButtonPressed) {
      yield ForgotPasswordInitial();

      try {
        ForgotPasswordResponse loginResponse =
            await userRepositories.forgotPassword(
          event.uid,
          event.mobileNumber,
          event.emailId,
          event.pan,
          event.brokerId,
        );
        yield ForgotPasswordSuccess('Success');
        //yield LoginInitial();
      } catch (error) {
        ForgotPasswordFailure(error: error.toString());
      }
    }
  }
}
