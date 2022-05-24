import 'package:web_socket_channel/io.dart';

class WebSocketBase {
  final String url;
  late final IOWebSocketChannel _channel;

  WebSocketBase(this.url) {
    _channel = IOWebSocketChannel.connect(url);
  }
  Stream<dynamic> getStream() {
    return _channel.stream.asBroadcastStream();
  }

  void add(Object data) {
    _channel.sink.add(data);
  }
}
