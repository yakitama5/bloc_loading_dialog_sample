import '../../importer.dart';

abstract class SampleState extends Equatable {
  const SampleState() : super();

  @override
  List<Object> get props => [];
}

class InitState extends SampleState {}

class DispProgressState extends SampleState {}

class DispSuccessState extends SampleState {}

class DispFailureState extends SampleState {
  final Error error;

  DispFailureState(this.error);
}

class SaveProgressState extends SampleState {}

class SaveSuccessState extends SampleState {}

class SaveFailureState extends SampleState {
  final Error error;

  SaveFailureState(this.error);
}
