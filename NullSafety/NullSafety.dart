/*
  Concept: Null Safety in Dart
  Dart Docs: https://dart.dev/null-safety

  Description:
  Null safety prevents runtime null exceptions. Use ? for nullable types, ! for non-null assertion,
  and 'late' for deferred initialization.

  Importance for Flutter:
  Prevents crashes when widgets receive null values from TextField, API, or database.

  Use Cases in Flutter:
  - Optional TextField input
  - API data that may be null
  - Widget state initialization
*/

void main() {
  String? nullableName;
  String nonNullableName = "Xyrel";

  // Null-aware operator
  print(nullableName ?? "No name provided");
  print(nonNullableName.length);

  // Null assertion (throws error if null)
  nullableName = "Hello";
  print(nullableName!.length);

  // late variable
  late String lateName;
  lateName = "Initialized later";
  print(lateName);

  // Nullable collections
  List<String>? names;
  names ??= [];
  names.add("Alice");
  print(names);

  Map<String, int>? scores;
  scores ??= {};
  scores["Math"] = 95;
  print(scores);

  // Flutter Use Case:
  // TextField input may be null: String? input = controller.text;
}
