/*
  Concept: Functions in Dart
  Dart Docs: https://dart.dev/guides/language/language-tour#functions

  Description:
  Functions perform tasks or return values. Dart supports named and optional
  parameters, arrow syntax (=>), and higher-order functions (functions as parameters).

  Importance for Flutter:
  Most Flutter widgets use callbacks (onPressed, onTap). Understanding functions is essential.

  Use Cases in Flutter:
  - Button onPressed callbacks
  - Event handling
  - Data processing for widgets
*/

void greet(String name) {
  print("Hello, $name!");
}

// Arrow function
int add(int a, int b) => a + b;

// Optional and named parameters
void showInfo({required String name, int age = 18}) {
  print("$name is $age years old.");
}

// Higher-order function
void repeat(int times, void Function(int) action) {
  for (int i = 0; i < times; i++) {
    action(i);
  }
}

void main() {
  greet("Xyrel");
  print("Sum: ${add(5, 10)}");
  showInfo(name: "Xyrel");
  showInfo(name: "Xyrel", age: 20);

  repeat(3, (i) => print("Repeat $i"));

  // Flutter Use Case:
  // ElevatedButton(onPressed: () => greet("Xyrel"))
}
