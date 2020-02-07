import 'package:ques_sample/repositories/sample_repository.dart';

class SampleFirestoreRepositry extends SampleRepository {
  @override
  Future<List<String>> fetch() async {
    // 2秒まつだけ
    await Future.delayed(Duration(seconds: 2));

    return Future.value([]);
  }

  @override
  Future<void> insert() async {
    // 2秒まつだけ
    return Future.wait([Future.delayed(Duration(seconds: 2))]);
  }
}
