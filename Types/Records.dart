// Dart 3.0+ Feature: Records
// To run: dart run records_demo.dart

// ✅ Define a typedef for a record type
typedef ButtonItem = ({String label, String icon, void Function()? onPressed});

// ✅ Function returning a record (multiple return values)
({String name, int age}) getUserInfo(Map<String, dynamic> json) {
  return (name: json['name'], age: json['age']);
}

void main() {
  print('=== Basic Records ===');

  // 1️⃣ Positional Record
  (String, int) person = ('Xyrel', 18);
  print('Name: ${person.$1}, Age: ${person.$2}');

  // 2️⃣ Named Record
  ({int x, int y}) coordinates = (x: 10, y: 20);
  print('Coordinates -> x: ${coordinates.x}, y: ${coordinates.y}');

  // 3️⃣ Mixed Record (positional + named)
  var mixed = ('First', a: true, 'Last');
  print('Mixed Record -> ${mixed.$1}, ${mixed.a}, ${mixed.$2}');

  print('\n=== Record Equality ===');

  // 4️⃣ Record Equality (same shape and values)
  (int, int, int) color1 = (255, 0, 0);
  (int, int, int) color2 = (255, 0, 0);
  print('Are color1 and color2 equal? ${color1 == color2}'); // true

  // 5️⃣ Different shapes (named fields differ)
  ({int r, int g, int b}) namedColor1 = (r: 255, g: 0, b: 0);
  ({int x, int y, int z}) namedColor2 = (x: 255, y: 0, z: 0);
  print(
    'Are namedColor1 and namedColor2 equal? ${namedColor1 == namedColor2}',
  ); // false

  print('\n=== Multiple Returns with Destructuring ===');

  final json = {'name': 'Xyrel', 'age': 18};
  final (:name, :age) = getUserInfo(json);
  print('Destructured -> name: $name, age: $age');

  print('\n=== List of Record Items (typedef example) ===');

  final List<ButtonItem> buttons = [
    (label: "Upload", icon: "📤", onPressed: () => print("Upload clicked")),
    (label: "Info", icon: "ℹ️", onPressed: () => print("Info clicked")),
  ];

  for (var button in buttons) {
    print('Button: ${button.icon} ${button.label}');
    if (button.onPressed != null) button.onPressed!();
  }

  print('\n=== Using Records in a Function ===');

  // Function returning swapped tuple
  (int, int) swap((int, int) pair) {
    var (a, b) = pair;
    return (b, a);
  }

  final swapped = swap((1, 2));
  print('Swapped Values -> ${swapped.$1}, ${swapped.$2}');
}
