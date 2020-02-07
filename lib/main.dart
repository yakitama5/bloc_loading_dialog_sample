import 'importer.dart';
import 'widgets/sample_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '質問用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SamplePage(),
    );
  }
}
