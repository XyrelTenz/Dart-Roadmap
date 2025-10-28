// variables_demo.dart
// Demonstrates all Dart variable concepts: var, null safety, late, final, const, and wildcard (_) variables.

void main() {
  print('=== Dart Variable Examples ===\n');

  // 1️⃣ Basic variable declaration (type inferred)
  var name = 'Bob';
  print('Name: $name'); // Output: Bob

  // 2️⃣ Explicit type declaration
  String lastName = 'Marley';
  print('Last name: $lastName'); // Output: Marley

  // 3️⃣ Using Object or dynamic types
  Object anything = 'Hello Object!';
  dynamic dynamicVar = 123;
  print('Object value: $anything');
  print('Dynamic value: $dynamicVar\n');

  // 4️⃣ Null safety examples
  // Non-nullable variable must be initialized
  int age = 18;
  // Nullable variable can hold null
  int? nullableAge;
  print('Age: $age');
  print('Nullable age (default): $nullableAge'); // null

  // Assigning value later
  nullableAge = 25;
  print('Nullable age (after assignment): $nullableAge\n');

  // 5️⃣ Default value (null for nullable)
  int? lineCount;
  assert(lineCount == null);
  print('lineCount default value: $lineCount');

  // Non-nullable must be initialized
  int count = 0;
  print('Initialized count: $count\n');

  // 6️⃣ late variables
  // Late variable declared, assigned later
  late String description;
  description = 'Feijoada!';
  print('Late variable description: $description');

  // Lazy initialization (runs only when used)
  late String temperature = readThermometer();
  print('Temperature (lazy init): $temperature\n');

  // 7️⃣ final and const
  final String nickname = 'Bobby';
  const int bar = 1000000;
  const double atm = 1.01325 * bar;
  print('Final nickname: $nickname');
  print('Const bar: $bar');
  print('Const atm: $atm');

  // Example: const collections
  var foo = const [];
  final barList = const [1, 2, 3];
  const baz = [4, 5, 6];
  print('Const list baz: $baz');

  // Changing a non-final variable that used const
  foo = [7, 8, 9];
  print('Foo (after change): $foo\n');

  // 8️⃣ Const with is, as, collection if, spread operators
  const Object i = 3;
  const list = [i as int];
  const map = {if (i is int) i: 'int'};
  const set = {if (list is List<int>) ...list};
  print('Const list: $list');
  print('Const map: $map');
  print('Const set: $set\n');

  // 9️⃣ Wildcard (_) variable examples
  print('=== Wildcard (_) Variable Examples ===');
  var _ = 'This variable is unused but valid.';
  print('Wildcard local variable example ran.');

  // Using _ in for loop
  var listItems = [1, 2, 3];
  for (var _ in listItems) {
    // We don’t need to use the loop variable
  }
  print('For loop with _ executed.');

  // Using _ in catch clause
  try {
    throw 'error!';
  } catch (_) {
    print('Caught an error with wildcard _');
  }

  // Using _ in function parameter
  listItems.where((_) => true).forEach(print);

  print('\n=== End of Demo ===');
}

// Simulated expensive function
String readThermometer() {
  print('Reading thermometer...'); // Called only once (lazy init demo)
  return '26°C';
}
