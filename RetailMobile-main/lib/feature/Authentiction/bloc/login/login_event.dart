part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String uid;
  final String pwd;
  final String brokerId;
  final String deviceInfo;
  final String source;
  final String deviceName;
  final String buildNumber;

  const LoginButtonPressed(
    this.uid,
    this.pwd,
    this.brokerId,
    this.deviceInfo,
    this.source,
    this.deviceName,
    this.buildNumber,
  );

  @override
  List<Object> get props =>
      [uid, pwd, brokerId, deviceInfo, source, deviceName, buildNumber];

  @override
  String toString() =>
      'LoginButtonPressed {uid: $uid, pwd: $pwd,brokerId : $brokerId , deviceInfo: $deviceInfo, source:$source,deviceName:$deviceName, buildNumber:$buildNumber }';
}
