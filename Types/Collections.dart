// ===============================
// DART COLLECTIONS DEMO WITH EXPLANATION
// ===============================
// This file demonstrates how Lists, Sets, and Maps work in Dart,
// including special collection elements like spread, null-aware,
// if and for elements.

void main() {
  print("========== LISTS ==========\n");

  // LISTS are ordered collections (like arrays in other languages).
  // They keep items in order and allow duplicates.
  var list = [1, 2, 3];
  print("List: $list"); // [1, 2, 3]

  // Lists start at index 0
  print("Second element (index 1): ${list[1]}"); // 2

  // You can modify elements by index
  list[1] = 10;
  print("After updating index 1: $list"); // [1, 10, 3]

  // You can check the total number of items
  print("Length of list: ${list.length}");

  // Constant list — cannot be modified
  const constantList = [1, 2, 3];
  print("Constant List: $constantList");
  // constantList[0] = 99; // ❌ Error if uncommented

  print("\n========== SETS ==========\n");

  // SETS are unordered collections of unique items (no duplicates)
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print("Set of halogens: $halogens");

  // Create an empty Set using <Type>{}
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  print("Elements Set: $elements");
  print("Length of Set: ${elements.length}");

  // If you try to add duplicates, they’re ignored
  elements.add('fluorine');
  print("After trying to add duplicate 'fluorine': $elements");

  // Constant set
  const constantSet = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print("Constant Set: $constantSet");

  print("\n========== MAPS ==========\n");

  // MAPS store key-value pairs (like a dictionary)
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };
  print("Gifts Map: $gifts");

  // Access values by key
  print("Value of key 'first': ${gifts['first']}");

  // Add a new key-value pair
  gifts['fourth'] = 'calling birds';
  print("After adding 'fourth': $gifts");

  // If you request a non-existing key, you get null
  print("Accessing non-existing key: ${gifts['tenth']}");

  // Create map with constructor
  var nobleGases = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  print("Noble Gases: $nobleGases");

  // Constant Map
  const constantMap = {2: 'helium', 10: 'neon', 18: 'argon'};
  print("Constant Map: $constantMap");

  print("\n========== NULL-AWARE ELEMENTS ==========\n");

  // Null-aware elements skip null values when using ? before them.
  int? absentValue = null;
  int? presentValue = 3;

  var items = [1, ?absentValue, ?presentValue, absentValue, 5];
  // ?absentValue is ignored because it's null
  // ?presentValue adds 3 because it's not null
  // absentValue (without ?) adds null explicitly
  print("Null-aware example in List: $items"); // [1, 3, null, 5]

  String? presentKey = 'Apple';
  String? absentKey = null;

  var mapExample = {
    presentKey: ?absentValue,
  }; // ignored because absentValue = null
  print("Map with null-aware value: $mapExample"); // {}

  print("\n========== SPREAD ELEMENTS ==========\n");

  // Spread elements use "..." to unpack collections into others
  var a = [1, 2, null, 4];
  var spreadItems = [0, ...a, 5];
  print("Spread Example: $spreadItems"); // [0, 1, 2, null, 4, 5]

  // Null-aware spread skips adding when collection is null
  List<int>? nullList = null;
  var b = [1, null, 3];
  var nullAwareSpread = [0, ...?nullList, ...?b, 4];
  print("Null-aware Spread Example: $nullAwareSpread"); // [0, 1, null, 3, 4]

  print("\n========== IF ELEMENTS ==========\n");

  var includeItem = true;
  var itemsIf = [0, if (includeItem) 1, 2, 3];
  // 1 is added only if includeItem is true
  print("If Element Example: $itemsIf");

  var name = 'apple';
  var itemsIfElse = [0, if (name == 'orange') 1 else 10, 2, 3];
  // Since name != 'orange', it adds 10
  print("If-Else Element Example: $itemsIfElse");

  Object data = 123;
  var typeInfo = [
    if (data case int i) 'Data is an integer: $i',
    if (data case String s) 'Data is a string: $s',
  ];
  print("If-Case Example: $typeInfo");

  print("\n========== FOR ELEMENTS ==========\n");

  var numbers = [2, 3, 4];
  var itemsFor = [1, for (var n in numbers) n * n, 7];
  // squares each element and adds them
  print("For Element Example: $itemsFor"); // [1, 4, 9, 16, 7]

  // Regular for loop version
  var itemsLoop = [for (var x = 5; x > 2; x--) x];
  print("Decrementing For Loop: $itemsLoop"); // [5, 4, 3]

  print("\n========== NESTED CONTROL FLOW ==========\n");

  // Combining for + if inside collection
  var nums = [1, 2, 3, 4, 5, 6, 7];
  var evenItems = [
    0,
    for (var n in nums)
      if (n.isEven) n,
    8,
  ];
  print("Even Numbers Only: $evenItems"); // [0, 2, 4, 6, 8]

  // Deep nesting: for + if + spread
  var nestItems = true;
  var ys = [1, 2, 3, 4];
  var nested = [
    if (nestItems) ...[
      for (var x = 0; x < 3; x++)
        for (var y in ys)
          if (x < y) x + y * 10,
    ],
  ];
  print("Deeply Nested Control Flow: $nested");
}
