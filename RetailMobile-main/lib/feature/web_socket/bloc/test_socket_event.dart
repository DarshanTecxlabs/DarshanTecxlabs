part of 'test_socket_bloc.dart';

@immutable
abstract class TestSocketEvent {}

class Send extends TestSocketEvent {
  final String message;

  Send(this.message);
}
