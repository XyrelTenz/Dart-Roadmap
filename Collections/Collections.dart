/*
  Concept: Collections in Dart (List, Map, Set)
  Dart Docs: https://dart.dev/guides/language/language-tour#collections

  Description:
  Collections store multiple values. Lists are ordered, Maps store key-value pairs,
  Sets store unique values. Dart provides iteration methods like forEach, map, and where.

  Importance for Flutter:
  Dynamic lists and data sets are common in Flutter UI components.

  Use Cases in Flutter:
  - Populate ListView.builder
  - Store API results in a list or map
  - Track unique values with Set
*/

void main() {
  // List
  List<String> courses = ["Math", "Physics"];
  courses.add("Chemistry");
  print(courses);

  // Iteration
  for (var course in courses) print("Course: $course");

  // Map
  Map<String, int> scores = {"Math": 90, "Physics": 85};
  scores["Chemistry"] = 92;
  scores.forEach((key, value) => print("$key: $value"));

  // Set
  Set<String> uniqueSubjects = {"Math", "Physics", "Math"};
  uniqueSubjects.forEach((s) => print("Unique: $s"));

  // Filtering & mapping
  List<String> filtered = courses.where((c) => c.startsWith("M")).toList();
  print("Filtered: $filtered");

  List<String> upperCourses = courses.map((c) => c.toUpperCase()).toList();
  print("Uppercase: $upperCourses");

  // Flutter Use Case:
  // ListView.builder(
  //   itemCount: courses.length,
  //   itemBuilder: (context, index) => Text(courses[index])
  // );
}
