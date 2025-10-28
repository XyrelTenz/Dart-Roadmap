/*
  Concept: Extension Methods
  Dart Docs: https://dart.dev/guides/language/language-tour#extensions

  Description:
  Extensions let you add functionality to existing classes without inheritance.

  Importance for Flutter:
  Enhance built-in classes like String, int, or Widget with helper methods.

  Use Cases in Flutter:
  - String formatting
  - Custom widget helpers
  - Reusable utility methods
*/

extension StringExtension on String {
  String get reversed => split('').reversed.join();
  bool get isEmptyOrNull => this.isEmpty;
}

extension IntExtension on int {
  bool get isEvenNumber => this % 2 == 0;
  bool get isOddNumber => this % 2 != 0;
}

void main() {
  String name = "Xyrel";
  print(name.reversed);

  print("".isEmptyOrNull);

  int num = 4;
  print(num.isEvenNumber);
  print(num.isOddNumber);

  // Flutter Use Case:
  // Extend String or Widget methods for convenience
}
