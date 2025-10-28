// TYPEDEFS (Type Aliases) IN DART 🧠
// To run: dart run typedefs_demo.dart
// Dart 2.13+ required

// --------------------------------------------------
// 1️⃣ BASIC TYPE ALIAS
// --------------------------------------------------

// Instead of writing `List<int>` everywhere
typedef IntList = List<int>;

void basicExample() {
  print('\n=== 1️⃣ Basic Type Alias ===');

  IntList numbers = [1, 2, 3, 4, 5];
  print('Numbers: $numbers');
  print('Sum: ${numbers.reduce((a, b) => a + b)}');
}

// --------------------------------------------------
// 2️⃣ GENERIC TYPE ALIAS
// --------------------------------------------------

// A generic alias for mapping any type X → list of X
typedef ListMapper<X> = Map<X, List<X>>;

void genericExample() {
  print('\n=== 2️⃣ Generic Type Alias ===');

  Map<String, List<String>> verbose = {
    'Fruits': ['Apple', 'Mango', 'Banana'],
  };

  ListMapper<String> shortForm = {
    'Cars': ['Tesla', 'Ford', 'Toyota'],
  };

  print('Verbose Map: $verbose');
  print('Short Form (with typedef): $shortForm');
}

// --------------------------------------------------
// 3️⃣ FUNCTION TYPEDEF (FUNCTION SIGNATURE ALIAS)
// --------------------------------------------------

// Instead of writing: int Function(int a, int b)
typedef Compare<T> = int Function(T a, T b);

// Example comparator
int sortNumbers(int a, int b) => a - b;

void functionAliasExample() {
  print('\n=== 3️⃣ Function Type Alias ===');

  // Checking if sortNumbers matches Compare<int>
  print('sortNumbers is Compare<int>? ${sortNumbers is Compare<int>}'); // true

  // Using typedef in a list sort
  List<int> nums = [9, 3, 6, 1];
  nums.sort(sortNumbers);
  print('Sorted numbers: $nums');
}

// --------------------------------------------------
// 4️⃣ FUNCTION TYPEDEF WITH VOID RETURN
// --------------------------------------------------

// Example typedef for a callback
typedef OnClick = void Function(String label);

void handleButtonPress(String label) {
  print('Button "$label" pressed!');
}

void callbackExample() {
  print('\n=== 4️⃣ Function Callback Alias ===');

  // Using typedef as a type for variable
  OnClick onClickHandler = handleButtonPress;
  onClickHandler('Upload');
  onClickHandler('Delete');
}

// --------------------------------------------------
// 5️⃣ FUNCTION TYPEDEF AS PARAMETER
// --------------------------------------------------
typedef MathOperation = num Function(num a, num b);

num calculate(num a, num b, MathOperation operation) {
  return operation(a, b);
}

num add(num a, num b) => a + b;
num multiply(num a, num b) => a * b;

void parameterExample() {
  print('\n=== 5️⃣ Function Typedef as Parameter ===');

  print('Add: ${calculate(10, 5, add)}');
  print('Multiply: ${calculate(10, 5, multiply)}');
}

// --------------------------------------------------
// 6️⃣ CLASS + FUNCTION TYPEDEF (ADVANCED USE CASE)
// --------------------------------------------------

// Defining a typedef for a record-like structure
typedef ButtonItem = ({String label, String icon, void Function()? onPressed});

// Function returning a ButtonItem
ButtonItem createButton(String label, String icon) {
  return (label: label, icon: icon, onPressed: () => print('Pressed: $label'));
}

void classLikeExample() {
  print('\n=== 6️⃣ Complex Typedef Use Case ===');

  final button = createButton('Info', 'ℹ️');
  print('Button created: ${button.icon} ${button.label}');
  button.onPressed?.call();
}

// --------------------------------------------------
// 7️⃣ COMBINING TYPEDEFS + GENERICS
// --------------------------------------------------

// Generic typedef for a response handler
typedef ResponseHandler<T> = void Function(T data);

void fetchData<T>(T data, ResponseHandler<T> handler) {
  handler(data);
}

void genericFunctionExample() {
  print('\n=== 7️⃣ Typedef + Generic Function ===');

  fetchData<int>(42, (data) => print('Received int: $data'));
  fetchData<String>('Success', (data) => print('Received string: $data'));
  fetchData<List<String>>(['A', 'B'], (data) => print('Received list: $data'));
}

// --------------------------------------------------
// MAIN
// --------------------------------------------------
void main() {
  basicExample();
  genericExample();
  functionAliasExample();
  callbackExample();
  parameterExample();
  classLikeExample();
  genericFunctionExample();
}
