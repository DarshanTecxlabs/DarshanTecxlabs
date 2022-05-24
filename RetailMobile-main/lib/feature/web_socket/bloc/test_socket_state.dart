part of 'test_socket_bloc.dart';

@immutable
abstract class TestSocketState {}

class TestSocketLoading extends TestSocketState {}

class TestSocketInitial extends TestSocketState {
  final Stream data;

  TestSocketInitial(this.data);
}
