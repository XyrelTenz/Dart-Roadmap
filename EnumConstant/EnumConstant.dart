/*
  Concept: Enums & Constants
  Dart Docs: https://dart.dev/guides/language/language-tour#enumerated-types

  Description:
  Enums define a fixed set of values. 'const' and 'final' define immutable values.

  Importance for Flutter:
  Helps maintain consistent states, colors, and styling without magic strings or numbers.

  Use Cases in Flutter:
  - Button states
  - Widget modes
  - Theme colors and padding constants
*/

enum Status { loading, success, error }

void main() {
  Status current = Status.loading;

  switch (current) {
    case Status.loading:
      print("Loading...");
      break;
    case Status.success:
      print("Success!");
      break;
    case Status.error:
      print("Error!");
      break;
  }

  const double pi = 3.14159;
  final String name = "Xyrel";

  print("PI: $pi, Name: $name");

  // Flutter Use Case:
  // Enum for widget state
  // Constants for colors, padding, font sizes
}
