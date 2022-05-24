part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {

  const ForgotPasswordEvent();
}

class SubmitButtonPressed extends ForgotPasswordEvent {
  final String uid;
  final String mobileNumber;
  final String emailId;
  final String pan;
  final String brokerId;


  const SubmitButtonPressed(this.uid, this.mobileNumber, this.emailId, this.pan, this.brokerId);

  @override
  List<Object> get props => [uid, mobileNumber, emailId, pan,brokerId];

  @override
  String toString() => 'SubmitButtonPressed {uid: $uid, mobileNo: $mobileNumber,emailId : $emailId , pan: $pan, brokerId: $brokerId, }';
}

