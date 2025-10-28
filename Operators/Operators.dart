/*
  Concept: Operators & Control Flow
  Dart Docs: https://dart.dev/guides/language/language-tour#operators

  Description:
  Dart supports arithmetic, logical, comparison, null-aware (??, ?.), and ternary operators.

  Importance for Flutter:
  Used for conditional UI rendering, calculations, and null handling.

  Use Cases in Flutter:
  - Conditional widgets
  - Checking null values
  - Calculating layout or styling
*/

void main() {
  int a = 5;
  int? b;
  int c = b ?? 10; // null-coalescing
  print(c);

  int x = 10;
  int y = 20;
  print(x > y ? "x bigger" : "y bigger"); // ternary

  bool flag = true;
  if (flag) print("Flag is true");

  // Logical operators
  bool aCond = true, bCond = false;
  print(aCond && bCond);
  print(aCond || bCond);
  print(!aCond);

  // Arithmetic
  int sum = x + y;
  int product = x * y;
  double div = y / x;
  print("Sum: $sum, Product: $product, Div: $div");

  // Flutter Use Case:
  // condition ? Widget() : SizedBox()
}
