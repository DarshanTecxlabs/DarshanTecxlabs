import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecxlabs_trading_app/feature/web_socket/web_socket.dart';

part 'test_socket_event.dart';
part 'test_socket_state.dart';

class TestSocketBloc extends Bloc<TestSocketEvent, TestSocketState> {
  TestSocketBloc() : super(TestSocketLoading());

  @override
  Stream<TestSocketState> mapEventToState(
    TestSocketEvent event,
  ) async* {
    final socket = WebSocketBase("wss://echo.websocket.org");

    yield TestSocketInitial(socket.getStream());
    if (event is Send) {
      socket.add(event.message);
      yield TestSocketInitial(socket.getStream());
    }
  }
}
