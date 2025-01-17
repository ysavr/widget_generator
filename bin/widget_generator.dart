import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:widget_generator/widget_generator.dart';

/// Entry point for Code Snippet Generator.
///
/// Provides a menu-driven interface to generate different types of widget
/// code snippets and save them to files.
Future<void> main(List<String> arguments) async {
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

/// Displays a sub-menu for button-related snippet generation.
///
/// Allows users to select different types of button snippets to generate.
Future<void> buttonMenu() async {
  while (true) {
    print('\nButton Sub-Menu:');
    print('1: Basic Button');
    print('2: Button with Outline Border');
    print('3: Splash Button');
    print('4: Back to Main Menu');

    stdout.write('Select a button type to generate: ');
    String? subChoice = stdin.readLineSync();

    switch (subChoice) {
      case '1':
        await chooseDirectoryAndGenerateSnippet('basic button');
        break;
      case '2':
        await chooseDirectoryAndGenerateSnippet('outline button');
        break;
      case '3':
        await chooseDirectoryAndGenerateSnippet('splash button');
        break;
      case '4':
        return; // Go back to main menu
      default:
        print('Invalid choice.');
    }
  }
}

/// Prompts the user to select a directory and generates a code snippet.
///
/// [snippetType] is the type of snippet to generate (e.g., "basic button", "login screen").
Future<void> chooseDirectoryAndGenerateSnippet(String snippetType) async {
  String output;
  switch (snippetType) {
    case 'basic button':
      stdout.write(
        'Enter the button label: ',
      );
      String? label = stdin.readLineSync();
      if (label != null && label.isNotEmpty) {
        output = CodeSnippetGenerator().elevatedButton(label);
        askSaveContent(output, "button_snippet.dart", WidgetPath.widgets);
        await copyToClipboard(output);
      } else {
        print('Button label cannot be empty.');
      }
      await waitForUserAcknowledgment();
      break;

    case 'outline button':
      output = CodeSnippetGenerator().outlineButton();
      askSaveContent(output, "outline_button_snippet.dart", WidgetPath.widgets);
      await copyToClipboard(output);
      break;

    case 'splash button':
      output = CodeSnippetGenerator().splashButton();
      askSaveContent(output, "splash_button.dart", WidgetPath.widgets);
      await copyToClipboard(output);
      break;

    case 'login screen':
      output = CodeSnippetGenerator().loginScreen();
      askSaveContent(output, "login_screen.dart", WidgetPath.screens);
      await copyToClipboard(output);
      await waitForUserAcknowledgment();
      break;
    default:
      print('Invalid choice.');
      return;
  }
}

/// Asks the user whether to save generated content to a file.
///
/// [output] is the generated code content.
/// [fileName] is the name of the file to save.
/// [widgetPath] is the directory path category for saving files.
Future<void> askSaveContent(
    String output, String fileName, WidgetPath widgetPath) async {
  await copyToClipboard(output);

  // Ask if the user wants to save the content
  stdout.write('Do you want to save this content to a file? (y/n): ');
  String? saveChoice = stdin.readLineSync()?.toLowerCase();

  if (saveChoice == 'y') {
    stdout.write('Enter the output directory (e.g., lib/widgets): ');
    String? outputDirectory = stdin.readLineSync();
    if (outputDirectory == null || outputDirectory.isEmpty) {
      outputDirectory = './gen/${widgetPath.name}';
    }
    // Save content to file
    writeToFile(outputDirectory, fileName, output);
  } else {
    print('Skipping save. Content has been copied to clipboard.');
  }
}

/// Writes the generated content to a specified file.
///
/// [outputDirectory] is the directory to save the file.
/// [fileName] is the name of the file.
/// [content] is the content to write into the file.
void writeToFile(String outputDirectory, String fileName, String content) {
  final filePath = path.join(outputDirectory, fileName);
  final file = File(filePath);

  // Create the directory if it doesn't exist
  final directory = Directory(outputDirectory);
  if (!directory.existsSync()) {
    directory.createSync(
      recursive: true,
    ); // recursive: true creates parent directories if needed
  }

  file.writeAsStringSync(content);
  print('$fileName file generated successfully at: $filePath');

  // Print the file content to the console
  print('\nGenerated file content:');
  print('--------------------------------');
  print(content);
  print('--------------------------------');
}

/// Copies the given [text] to the clipboard.
///
/// Clipboard functionality depends on the platform.
Future<void> copyToClipboard(String text) async {
  if (Platform.isWindows) {
    final process = await Process.start('clip', []);
    process.stdin.writeln(text);
    await process.stdin.close();
    print('Text copied to clipboard!');
  } else if (Platform.isMacOS) {
    final process = await Process.start('pbcopy', []);
    process.stdin.writeln(text);
    await process.stdin.close();
    print('Text copied to clipboard!');
  } else if (Platform.isLinux) {
    final process = await Process.start('xclip', ['-selection', 'clipboard']);
    process.stdin.writeln(text);
    await process.stdin.close();
    print('Text copied to clipboard!');
  } else {
    print('Clipboard functionality is not supported on this platform.');
  }
}

/// Waits for user acknowledgment to return to the menu or exit the program.
Future<void> waitForUserAcknowledgment() async {
  stdout.write(
      '\nPress Enter to return to the main menu or type "q" to exit the program: ');
  String? input = stdin.readLineSync();

  if (input != null && input.toLowerCase() == 'q') {
    print('Exiting.');
    exit(0); // Quit the program
  } else {
    print('Returning to the main menu...');
  }
}
