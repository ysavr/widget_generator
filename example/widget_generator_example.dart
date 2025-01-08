import 'dart:io';
import 'package:widget_generator/src/widget_generator_base.dart';

Future<void> main() async {
  print('\nWelcome to a code snippet generator 🚀');

  while (true) {
    print('1: Button');
    print('2: Login Screen');
    print('3: Exit');

    stdout.write(
      'Select a snippet to generate: ',
    );
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await buttonMenu();
        break;
      case '2':
        await chooseDirectoryAndGenerateSnippet('login screen');
        break;
      case '3':
        print('Exiting.');
        return;
      default:
        print('Invalid choice. Please select 1, 2, or 3.');
    }
  }
}
