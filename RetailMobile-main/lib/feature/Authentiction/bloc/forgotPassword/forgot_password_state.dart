part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}
class ForgotPasswordSuccess extends ForgotPasswordState{
  final forgotPasswordData;
  const ForgotPasswordSuccess(this.forgotPasswordData);

  ForgotPasswordResponse get getForgotPasswordResponse=>forgotPasswordData;

  @override
  List<Object> get props => [forgotPasswordData];

  @override
  String toString()=> 'Success {$forgotPasswordData}';
}
class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;
  const ForgotPasswordFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString()=> 'ForgotPasswordFailure {$error}';

}
