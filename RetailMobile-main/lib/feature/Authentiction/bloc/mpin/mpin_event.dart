part of 'mpin_bloc.dart';

abstract class MpinEvent extends Equatable {
  const MpinEvent();
}

class MpinButtonPressed extends MpinEvent {
  final String uid;
  final String mpin;
  final String devicempinkey;
  final String brokerId;
  final String deviceInfo;
  final String source;
  final String deviceName;
  final String buildNumber;

  const MpinButtonPressed(

      this.uid,this.mpin,this.devicempinkey, this.brokerId, this.deviceInfo, this.source, this.deviceName, this.buildNumber);

  @override
  List<Object> get props => [uid,mpin,devicempinkey,brokerId,deviceInfo,source,deviceName,buildNumber];

  @override
  String toString() => 'MpinButtonPressed {uid: $uid, mpin:$mpin, brokerId:$brokerId, devicempinkey:$devicempinkey,deviceInfo:$deviceInfo,source:$source,deviceName:$deviceName,buildNumber:$buildNumber}';
}
