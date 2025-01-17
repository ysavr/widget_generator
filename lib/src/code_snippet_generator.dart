import 'package:widget_generator/widget_generator.dart';

/// A class for generating Flutter widget code snippets.
///
/// The `CodeSnippetGenerator` provides methods to generate common widget
/// templates like buttons and login screens, simplifying the process of
/// creating reusable Flutter components.
class CodeSnippetGenerator {
  /// Generates a Dart code snippet for an `ElevatedButton` widget.
  ///
  /// The snippet includes an `ElevatedButton` with the provided [label] as
  /// the button's text. This can be used as a base for creating styled
  /// buttons in Flutter applications.
  ///
  /// - [label]: The text to display on the button.
  /// - Returns: A Dart code snippet as a `String` representing the widget.
  String elevatedButton(String label) {
    return elevatedButtonSnippet(label);
  }

  /// Generates a Dart code snippet for an `OutlinedButton` widget.
  ///
  /// This snippet provides a template for creating an `OutlinedButton`,
  /// which is a Flutter button with an outline border and no fill color.
  ///
  /// - Returns: A Dart code snippet as a `String` representing the widget.
  String outlineButton() {
    return outlineButtonSnippet();
  }

  /// Generates a Dart code snippet for a "splash button" widget.
  ///
  /// A splash button provides a ripple effect on touch, commonly used in
  /// material design widgets in Flutter.
  ///
  /// - Returns: A Dart code snippet as a `String` representing the widget.
  String splashButton() {
    return splashButtonSnippet();
  }

  /// Generates a Dart code snippet for a login screen.
  ///
  /// The login screen snippet includes basic elements such as username and
  /// password text fields and a login button. It serves as a template for
  /// creating authentication screens in Flutter applications.
  ///
  /// - Returns: A Dart code snippet as a `String` representing the login screen.
  String loginScreen() {
    return loginScreenSnippet();
  }
}
