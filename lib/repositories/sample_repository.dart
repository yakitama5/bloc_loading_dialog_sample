abstract class SampleRepository {
  /// なんらかの取得処理
  Future<List<String>> fetch();

  /// なんらかの登録処理
  Future<void> insert();
}
