import 'package:widget_generator/src/code_snippet_generator.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = CodeSnippetGenerator();

    setUp(() {
      // Additional setup goes here.
    });

    String buttonCode = '''
ElevatedButton(
  onPressed: () {
    // TODO: Implement button press logic here
  },
  child: Text('label'),
)
''';
    test('First Test', () {
      expect(awesome.elevatedButton("label"), buttonCode);
    });
  });
}
