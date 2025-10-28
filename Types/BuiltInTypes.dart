// builtin_types_demo.dart
// Demonstrates Dart built-in types: Numbers, Strings, Booleans, Runes, and Symbols.

import 'package:characters/characters.dart';

void main() {
  print('=== Dart Built-in Types Demo ===\n');

  // 🔹 1️⃣ NUMBERS
  print('--- NUMBERS ---');
  // int example
  var x = 1;
  var hex = 0xDEADBEEF;
  print('Integer x: $x');
  print('Hexadecimal: $hex');

  // double example
  var y = 1.1;
  var exponents = 1.42e5;
  print('Double y: $y');
  print('Exponential: $exponents');

  // num can hold both int and double
  num z = 10;
  z += 2.5;
  print('Num z after addition: $z');

  // String to number
  var one = int.parse('1');
  var onePointOne = double.parse('1.1');
  print('String -> int: $one');
  print('String -> double: $onePointOne');

  // Number to String
  String oneAsString = 1.toString();
  String piAsString = 3.14159.toStringAsFixed(2);
  print('int -> String: $oneAsString');
  print('double -> String (2 decimals): $piAsString');

  // Bitwise operations
  print('Bitwise examples:');
  print('(3 << 1) = ${3 << 1}');
  print('(3 | 4)  = ${3 | 4}');
  print('(3 & 4)  = ${3 & 4}');

  // Constants using numbers
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
  print('Const result (msUntilRetry): $msUntilRetry');

  // Digit separators for readability (Dart 3.6+)
  var n1 = 1_000_000;
  var n2 = 0.000_000_000_01;
  var n3 = 0x00_14_22_01_23_45;
  var n4 = 555_123_4567;
  var n5 = 100__000_000__000_000;
  print('Digit separator examples: $n1, $n2, $n3, $n4, $n5\n');

  // 🔹 2️⃣ STRINGS
  print('--- STRINGS ---');
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
  print('$s1\n$s2\n$s3\n$s4');

  // String interpolation
  var s = 'string interpolation';
  print('Dart has $s, which is very handy.');
  print('That deserves all caps: ${s.toUpperCase()} is very handy!');

  // Concatenation
  var s5 =
      'String '
      'concatenation '
      "works even over line breaks.";
  print(s5);
  var s6 = 'The + operator ' + 'works, as well.';
  print(s6);

  // Multiline strings
  var multi1 = '''
You can create
multi-line strings like this one.
''';
  var multi2 = """This is also a
multi-line string.""";
  print(multi1);
  print(multi2);

  // Raw string
  var raw = r'In a raw string, not even \n gets special treatment.';
  print(raw);

  // Const string examples
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';
  const validConstString = '$aConstNum $aConstBool $aConstString';
  print('Valid const string: $validConstString\n');

  // 🔹 3️⃣ BOOLEANS
  print('--- BOOLEANS ---');
  var fullName = '';
  var hitPoints = 0;
  var unicorn = null;
  var iMeantToDoThis = 0 / 0;

  print('Is fullName empty? ${fullName.isEmpty}');
  print('Hit points == 0? ${hitPoints == 0}');
  print('Unicorn == null? ${unicorn == null}');
  print('NaN check: ${iMeantToDoThis.isNaN}\n');

  // 🔹 4️⃣ RUNES & GRAPHEME CLUSTERS
  print('--- RUNES & GRAPHEME CLUSTERS ---');
  var hi = 'Hi 🇩🇰'; // Contains emoji (2 code units)
  print('Original string: $hi');
  print('The end of the string (substring): ${hi.substring(hi.length - 1)}');
  print('The last character (grapheme): ${hi.characters.last}\n');

  // Unicode characters
  var heart = '\u2665'; // ♥
  var laugh = '\u{1f606}'; // 😆
  print('Unicode heart: $heart');
  print('Unicode laugh emoji: $laugh\n');

  // 🔹 5️⃣ SYMBOLS
  print('--- SYMBOLS ---');
  Symbol sym1 = #radix;
  Symbol sym2 = #bar;
  print('Symbol 1: $sym1');
  print('Symbol 2: $sym2\n');

  print('=== End of Built-in Types Demo ===');
}
