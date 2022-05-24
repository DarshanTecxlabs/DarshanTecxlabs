part of 'scrip_bloc.dart';

abstract class ScripState extends Equatable {
  const ScripState();

  @override
  List<Object> get props => [];
}

class ScripInitial extends ScripState {}

class ScripLoaded extends ScripState {
  final ScripModel scripModel;

  ScripLoaded(this.scripModel);
}
