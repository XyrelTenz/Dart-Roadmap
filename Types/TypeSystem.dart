// dart_type_system.dart
// -----------------------------------------------------------
// 📘 DART TYPE SYSTEM DEMO WITH EXPLANATIONS
// -----------------------------------------------------------
// This file shows how Dart ensures type safety using static
// (compile-time) and runtime checks. It also covers type inference,
// overriding, covariance, and sound typing principles.

// 1️⃣ SOUNDNESS — Ensures variable values always match their declared types.
// -----------------------------------------------------------

void printInts(List<int> numbers) => print(numbers);

void soundnessExample() {
  // ❌ Unsound: No type argument, inferred as List<dynamic>
  final list = [];
  list.add(1);
  list.add('2'); // runtime risk

  // printInts(list); // ❌ Error: List<dynamic> can't be List<int>

  // ✅ Fixed by adding <int>
  final typedList = <int>[];
  typedList.add(1);
  typedList.add(2); // only ints allowed
  printInts(typedList); // ✅ Works
}

// 2️⃣ RUNTIME CHECKS — Catches invalid casts at runtime.
// -----------------------------------------------------------

class Animal {}

class Dog extends Animal {}

class Cat extends Animal {}

void runtimeCheckExample() {
  List<Animal> animals = <Dog>[Dog()];
  // ❌ Runtime failure: List<Dog> is not List<Cat>
  try {
    List<Cat> cats = animals as List<Cat>; // runtime TypeError
    print(cats);
  } catch (e) {
    print('Runtime check caught: $e');
  }
}

// 3️⃣ IMPLICIT DOWNCAST FROM DYNAMIC
// -----------------------------------------------------------

int assumeString(dynamic obj) {
  // Dart checks at runtime if obj is a String
  String str = obj;
  return str.length;
}

void downcastExample() {
  print(assumeString("Hello")); // ✅ Works
  try {
    print(assumeString(123)); // ❌ Throws TypeError
  } catch (e) {
    print('Runtime downcast error: $e');
  }
}

// 4️⃣ TYPE INFERENCE — Dart infers types automatically.
// -----------------------------------------------------------

void inferenceExample() {
  var arguments = {'name': 'Xyrel', 'age': 18};
  // inferred as Map<String, Object>

  print(arguments);

  // Local variable inference:
  var x = 3; // inferred as int
  // x = 3.5; // ❌ Error: type 'double' not assignable to 'int'

  num y = 3; // ✅ num allows int and double
  y = 4.5;
  print(y);
}

// 5️⃣ GENERICS AND TYPE SAFETY
// -----------------------------------------------------------

void genericExample() {
  // Dynamic list — allows any type, but unsafe.
  List<dynamic> anything = [1, 'two', true];

  // ✅ Safer: Typed list
  List<int> ints = [1, 2, 3];
  print(ints);

  // ❌ Unsafe cast example
  try {
    List<Cat> cats = <dynamic>[Dog()] as List<Cat>;
    print(cats);
  } catch (e) {
    print('Generic type error: $e');
  }
}

// 6️⃣ METHOD OVERRIDING — SOUND PARAMETER AND RETURN TYPES
// -----------------------------------------------------------

class BaseAnimal {
  void chase(Animal a) => print("BaseAnimal chasing Animal");
  Animal get parent => Animal();
}

class HoneyBadger extends BaseAnimal {
  // ✅ Return type can be a subtype
  @override
  HoneyBadger get parent => HoneyBadger();

  // ✅ Parameter can be a supertype
  @override
  void chase(Object a) => print("HoneyBadger can chase anything!");
}

class CatHunter extends BaseAnimal {
  // ❌ Invalid: parameter is subtype (too strict)
  // @override
  // void chase(Cat c) => print("CatHunter chasing a Cat!");
  // Fix: use covariant if needed
  @override
  void chase(covariant Cat c) => print("CatHunter chasing specific cat!");
}

void overridingExample() {
  var badger = HoneyBadger();
  badger.chase("Mouse");
  print(badger.parent);

  var catHunter = CatHunter();
  catHunter.chase(Cat());
}

// 7️⃣ TYPE SUBSTITUTION — PRODUCERS vs CONSUMERS
// -----------------------------------------------------------

class MaineCoon extends Cat {}

void substitutionExample() {
  // PRODUCER: You can replace with subtype
  Cat cat = MaineCoon(); // ✅ Safe

  // CONSUMER: You can replace with supertype
  Animal a = Cat(); // ✅ Safe

  // ❌ Invalid substitution
  // MaineCoon m = Cat(); // Not every Cat is a MaineCoon
  // static error

  // GENERIC VERSION
  List<MaineCoon> maineCoons = [];
  List<Cat> cats = maineCoons; // ✅ List<MaineCoon> <: List<Cat>
  print(cats);

  // ❌ Opposite not allowed
  // List<Animal> animals = [];
  // List<Cat> bad = animals; // static analysis error
}

// 8️⃣ TYPE INFERENCE USING BOUNDS
// -----------------------------------------------------------

class A<X extends A<X>> {}

class B extends A<B> {}

class C extends B {}

void f<X extends A<X>>(X x) {}

void boundsExample() {
  f(B()); // ✅ OK
  f(C()); // ✅ OK because of inference using bounds
}

// 9️⃣ COVARIANT PARAMETERS
// -----------------------------------------------------------

class Mouse extends Animal {}

class Cat2 extends Animal {
  @override
  void chase(covariant Mouse m) {
    print("Cat is chasing a mouse");
  }
}

void covariantExample() {
  var c = Cat2();
  c.chase(Mouse()); // ✅ Works
  try {
    c.chase(Animal()); // ❌ runtime TypeError
  } catch (e) {
    print('Covariant runtime check: $e');
  }
}

// 🧩 MAIN EXECUTION — Run all examples sequentially
// -----------------------------------------------------------

void main() {
  print("1️⃣ SOUNDNESS:");
  soundnessExample();

  print("\n2️⃣ RUNTIME CHECKS:");
  runtimeCheckExample();

  print("\n3️⃣ IMPLICIT DOWNCAST:");
  downcastExample();

  print("\n4️⃣ TYPE INFERENCE:");
  inferenceExample();

  print("\n5️⃣ GENERICS:");
  genericExample();

  print("\n6️⃣ METHOD OVERRIDING:");
  overridingExample();

  print("\n7️⃣ TYPE SUBSTITUTION:");
  substitutionExample();

  print("\n8️⃣ INFERENCE USING BOUNDS:");
  boundsExample();

  print("\n9️⃣ COVARIANT PARAMETERS:");
  covariantExample();
}
