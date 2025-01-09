String elevatedButtonSnippet(String label) {
  String code = '''
ElevatedButton(
  onPressed: () {
    // TODO: Implement button press logic here
  },
  child: Text('$label'),
)
''';

  return code;
}
