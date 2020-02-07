import 'package:ques_sample/blocs/sample/sample_event.dart';
import 'package:ques_sample/blocs/sample/sample_state.dart';
import 'package:ques_sample/repositories/sample_repository.dart';

import '../../importer.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final SampleRepository _repository;

  SampleBloc({SampleRepository repository})
      : assert(repository != null),
        _repository = repository,
        super();

  @override
  SampleState get initialState => InitState();

  @override
  Stream<SampleState> mapEventToState(SampleEvent event) async* {
    if (event is InitEvent) {
      yield* _init(event);
    } else if (event is SaveEvent) {
      yield* _save(event);
    }
  }

  Stream<SampleState> _init(InitEvent event) async* {
    yield DispProgressState();

    try {
      await _repository.fetch();

      yield DispSuccessState();
    } catch (_) {
      yield DispFailureState(_);
    }
  }

  Stream<SampleState> _save(SaveEvent event) async* {
    yield SaveProgressState();

    try {
      await _repository.insert();
      yield SaveSuccessState();
    } catch (_) {
      yield SaveFailureState(_);
    }
  }
}
