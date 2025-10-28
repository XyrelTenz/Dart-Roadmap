/*
  Concept: Generics in Dart
  Dart Docs: https://dart.dev/guides/language/language-tour#generics

  Description:
  Generics provide type safety for classes, methods, and collections.
  Use <T> to create reusable and type-safe structures.

  Importance for Flutter:
  Ensures List<T>, Map<K,V>, or custom classes handle correct types at compile time.

  Use Cases in Flutter:
  - Generic models for API data
  - Reusable ListView widgets
  - Type-safe custom components
*/

class Box<T> {
  T content;
  Box(this.content);

  void show() => print("Content: $content");
}

class Pair<K, V> {
  K key;
  V value;
  Pair(this.key, this.value);
}

void main() {
  Box<int> intBox = Box(123);
  Box<String> strBox = Box("Hello");

  intBox.show();
  strBox.show();

  Pair<String, int> pair = Pair("Xyrel", 18);
  print("${pair.key} is ${pair.value}");

  // Generic List
  List<Box<String>> boxes = [Box("A"), Box("B")];
  boxes.forEach((b) => b.show());

  // Flutter Use Case:
  // Generic List<T> in ListView.builder for type-safe data
}
