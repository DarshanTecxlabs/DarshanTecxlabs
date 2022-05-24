part of 'mpin_bloc.dart';

abstract class MpinState extends Equatable {
  const MpinState();

  @override
  List<Object> get props => [];
}

class MpinInitial extends MpinState {}

class MpinLoading extends MpinState {}
  class MpinSuccess extends MpinState{
  final mpinData;
  const MpinSuccess(this.mpinData);

  MpinResponse get getMpinResponse=>mpinData;

  @override
  List<Object> get props => [mpinData];

  @override
  String toString()=> 'MpinSuccess {$mpinData}';
  }
  class MpinFailure extends MpinState {
    final String error;

    const MpinFailure({required this.error});

    @override
    List<Object> get props => [error];

    @override
    String toString() => 'MpinFailure {$error}';
  }
