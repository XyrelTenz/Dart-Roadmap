/*
  Concept: Variables & Data Types in Dart
  Dart Docs: https://dart.dev/guides/language/language-tour#variables

  Description:
  Variables store data in memory. Dart supports int, double, String, bool,
  List, Map, Set, and null safety with ? and ! operators. 'late' allows deferred initialization.

  Importance for Flutter:
  Flutter widgets rely on Dart variables for state, input values, and dynamic UI updates.

  Use Cases in Flutter:
  - Store TextField input
  - Keep track of widget state
  - Store API data in memory
*/

void main() {
  // Basic types
  int age = 18;
  double height = 5.9;
  String name = "Xyrel";
  bool isStudent = true;

  // Nullable and late
  String? nullableName;
  late String lateName;
  lateName = "Assigned later";

  // Collections
  List<String> courses = ["Math", "Physics"];
  Map<String, int> scores = {"Math": 90, "Physics": 85};

  // Printing
  print("$name is $age years old, height $height");
  print("Courses: ${courses.join(", ")}");
  print("Scores: ${scores['Math']}");

  // Flutter Use Case:
  // Use variables to store TextField input or state of a widget
}
