import '../../importer.dart';

abstract class SampleEvent extends Equatable {
  const SampleEvent() : super();

  @override
  List<Object> get props => [];
}

/// 初期表示イベント
class InitEvent extends SampleEvent {}

/// 保存イベント
class SaveEvent extends SampleEvent {}
