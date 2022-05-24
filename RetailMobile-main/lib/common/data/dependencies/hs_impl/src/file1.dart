import 'file11.dart';
import 'file4.dart';
import 'file2.dart';
import 'file5.dart';

class HSConnection {
  Class6? _cv1;

  static final HSConnection _cv2 = HSConnection._internal();

  HSConnection._internal();

  static HSConnection getInstance() => _cv2;

  void connect(
      String url, HSFeedListener feedListener, String jwt, String redisKey,
      {bool isSecure = false, String? deviceId, int pingIntervalInSecs = 30}) {
    _cv1?.f3();
    _cv1 = new Class6(
        (isSecure == true ? "wss://$url" : "ws://$url"), feedListener);
    _cv1!.status = ConnectionStatus.IN_PROGRESS;
    _cv1!.f1(jwt, redisKey, deviceId, pingIntervalInSecs);
  }

  void connectWithXAccessToken(
      String url, HSFeedListener feedListener, String xAccessToken,
      {bool isSecure = false, int pingIntervalInSecs = 30}) {
    _cv1?.f3();
    _cv1 = new Class6(
        (isSecure == true ? "wss://$url" : "ws://$url"), feedListener);
    _cv1!.status = ConnectionStatus.IN_PROGRESS;
    _cv1!.f2(xAccessToken, pingIntervalInSecs);
  }

  ConnectionStatus getStatus() {
    if (_cv1 == null) return ConnectionStatus.DISCONNECTED;
    return _cv1!.status;
  }

  void disconnect() => _cv1?.f3(true);

  void subscribeScrip(List<String> scrips, int channelNum) =>
      _cv1?.f7(List<String>.from(scrips), channelNum);

  void unsubscribeScrip(List<String> scrips, int channelNum) =>
      _cv1?.f8(List<String>.from(scrips), channelNum);

  void subscribeIndex(List<String> scrips, int channelNum) =>
      _cv1?.f9(List<String>.from(scrips), channelNum);

  void unsubscribeIndex(List<String> scrips, int channelNum) =>
      _cv1?.f10(List<String>.from(scrips), channelNum);

  void subscribeDepth(List<String> scrips, int channelNum) =>
      _cv1?.f11(List<String>.from(scrips), channelNum);

  void unsubscribeDepth(List<String> scrips, int channelNum) =>
      _cv1?.f12(List<String>.from(scrips), channelNum);

  void channelPause(List<int> channelArray) =>
      _cv1?.f13(List<int>.from(channelArray));

  void channelResume(List<int> channelArray) =>
      _cv1?.f14(List<int>.from(channelArray));

  void snapshotScrip(List<String> scrips) =>
      _cv1?.f15(List<String>.from(scrips));

  void snapshotDepth(List<String> scrips) =>
      _cv1?.f16(List<String>.from(scrips));

  void snapshotIndex(List<String> scrips) =>
      _cv1?.f17(List<String>.from(scrips));

  void subscribeOpChain(Scrip scrip, int strikePrice, int higherStrikes,
          int lowerStrikes, int channel) =>
      _cv1?.f20(scrip, strikePrice, higherStrikes, lowerStrikes, channel);
}
