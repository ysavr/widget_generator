/// Represents the possible output directories for generated widget snippets.
///
/// The `WidgetPath` enum is used to categorize generated code snippets based
/// on their type, ensuring that they are saved in the appropriate directory.
///
/// - [widgets]: Represents a directory for reusable widget snippets, such as buttons.
/// - [screens]: Represents a directory for complete screen templates, such as login screens.
enum WidgetPath {
  /// Directory for saving reusable widget snippets.
  widgets,

  /// Directory for saving complete screen templates.
  screens,
}
