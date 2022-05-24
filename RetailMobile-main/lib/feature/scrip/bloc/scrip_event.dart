part of 'scrip_bloc.dart';

abstract class ScripEvent extends Equatable {
  const ScripEvent();

  @override
  List<Object> get props => [];
}

class SubscribeAsDepth extends ScripEvent {
  final ScripModel scripModel;

  SubscribeAsDepth(this.scripModel);
}

class UpdateDepth extends ScripEvent {
  final ScripModel scripModel;

  UpdateDepth(this.scripModel);
}

class UnsubscribeDepth extends ScripEvent {
  final ScripModel scripModel;

  UnsubscribeDepth(this.scripModel);
}
