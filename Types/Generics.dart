// GENERICS IN DART 🧠
// To run: dart run generics_demo.dart

import 'dart:collection';

// --------------------------------------------------
// 1️⃣ BASIC EXAMPLE - WHY USE GENERICS
// --------------------------------------------------
void basicExample() {
  print('\n=== 1️⃣ Basic Example ===');

  // ✅ Correct: only strings allowed
  var names = <String>['Seth', 'Kathy', 'Lars'];
  print('Names: $names');

  // ❌ Uncommenting this line causes a compile-time error:
  // names.add(42); // Error: 42 is not a String
  // This is type safety — Dart prevents wrong types.
}

// --------------------------------------------------
// 2️⃣ REDUCING DUPLICATE CODE WITH GENERIC INTERFACE
// --------------------------------------------------

// ❌ Without Generics → You’d need multiple similar interfaces:
// abstract class ObjectCache { Object getByKey(String key); void setByKey(String key, Object value); }
// abstract class StringCache { String getByKey(String key); void setByKey(String key, String value); }

// ✅ With Generics → One reusable interface:
abstract class Cache<T> {
  T? getByKey(String key);
  void setByKey(String key, T value);
}

// Example implementation using String type
class StringCache implements Cache<String> {
  final Map<String, String> _cache = {};
  @override
  String? getByKey(String key) => _cache[key];
  @override
  void setByKey(String key, String value) => _cache[key] = value;
}

// --------------------------------------------------
// 3️⃣ PARAMETERIZED COLLECTION LITERALS
// --------------------------------------------------
void parameterizedCollections() {
  print('\n=== 3️⃣ Parameterized Collection Literals ===');

  var names = <String>['Seth', 'Kathy', 'Lars'];
  var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for robots',
    'humans.txt': 'We are people, not machines',
  };

  print('List: $names');
  print('Set: $uniqueNames');
  print('Map: $pages');
}

// --------------------------------------------------
// 4️⃣ USING GENERICS WITH CONSTRUCTORS
// --------------------------------------------------
void constructorsExample() {
  print('\n=== 4️⃣ Generics with Constructors ===');

  var names = <String>['Xyrel', 'Tenefrancia'];
  var nameSet = Set<String>.of(names);
  print('Set created from list: $nameSet');

  var views = SplayTreeMap<int, String>();
  views[1] = 'Home';
  views[2] = 'Profile';
  print('SplayTreeMap: $views');
}

// --------------------------------------------------
// 5️⃣ RUNTIME TYPE CHECKING (REIFIED GENERICS)
// --------------------------------------------------
void runtimeTypeExample() {
  print('\n=== 5️⃣ Reified Generic Type ===');

  var names = <String>[];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print('Is names a List<String>? ${names is List<String>}'); // ✅ true
  print('Is names a List<int>? ${names is List<int>}'); // ❌ false
  // ✅ Dart generics keep type info at runtime (unlike Java).
}

// --------------------------------------------------
// 6️⃣ RESTRICTING TYPE PARAMETERS (BOUNDS)
// --------------------------------------------------

// A generic class where T must extend Object (non-nullable)
class Foo<T extends Object> {
  String toString() => "Instance of Foo<$T>";
}

// A custom base class
class SomeBaseClass {
  void greet() => print("Hello from SomeBaseClass!");
}

// Restricting T to SomeBaseClass or its subclasses
class Bar<T extends SomeBaseClass> {
  void show(T instance) {
    instance.greet();
  }
}

class Extender extends SomeBaseClass {
  @override
  void greet() => print("Hello from Extender!");
}

void boundsExample() {
  print('\n=== 6️⃣ Restricting Type Parameters (Bounds) ===');

  var foo = Foo<int>();
  print(foo);

  var bar1 = Bar<SomeBaseClass>();
  bar1.show(SomeBaseClass());

  var bar2 = Bar<Extender>();
  bar2.show(Extender());

  // ❌ Invalid: Object does not extend SomeBaseClass
  // var invalid = Bar<Object>();
}

// --------------------------------------------------
// 7️⃣ SELF-REFERENTIAL TYPE RESTRICTION (F-BOUNDS)
// --------------------------------------------------

// Comparable<T> pattern (type can compare to itself)
abstract interface class Comparable<T> {
  int compareTo(T other);
}

int compareAndOffset<T extends Comparable<T>>(T t1, T t2) =>
    t1.compareTo(t2) + 1;

class A implements Comparable<A> {
  @override
  int compareTo(A other) {
    print('Comparing A instances...');
    return 0; // Pretend equal
  }
}

void fBoundExample() {
  print('\n=== 7️⃣ F-Bound (Self-referential restriction) ===');

  int result = compareAndOffset(A(), A());
  print('Result: $result');
}

// --------------------------------------------------
// 8️⃣ GENERIC FUNCTION / METHOD
// --------------------------------------------------
T first<T>(List<T> items) {
  print('Returning the first item of type $T');
  return items[0];
}

void genericMethodExample() {
  print('\n=== 8️⃣ Generic Function Example ===');

  var numbers = <int>[10, 20, 30];
  var words = <String>['Dart', 'Flutter', 'Nuxt'];

  int firstNum = first(numbers);
  String firstWord = first(words);

  print('First int: $firstNum');
  print('First String: $firstWord');
}

// --------------------------------------------------
// MAIN - Run all examples
// --------------------------------------------------
void main() {
  basicExample();
  var stringCache = StringCache();
  stringCache.setByKey('lang', 'Dart');
  print('\n=== 2️⃣ Generic Interface ===');
  print('From cache: ${stringCache.getByKey('lang')}');

  parameterizedCollections();
  constructorsExample();
  runtimeTypeExample();
  boundsExample();
  fBoundExample();
  genericMethodExample();
}
