// import "dart:io";
import "DataStructureAndAlgorithm/Fibonacci.dart";

import "EnumConstant/EnumConstant.dart";

class Student<T> {
  T value;

  Student(this.value);
}

class Users {
  String name;
  int age;

  Users(this.name, this.age);
}

void main() {
  // stdout.write("Enter Number: ");
  // int? number = int.tryParse(stdin.readLineSync()!);

  // print(number);
  Student student = Student(10);
  print(student.value);

  print(Fibonacci(10));
  print("Hello World");

  // Record = Tuple
  ({int R, int G, int B}) colorTheme = (R: 255, G: 0, B: 0);
  print(colorTheme);

  ({String name, int age}) getUserInfo(Map<String, dynamic> json) {
    return (name: json['name'], age: json['age']);
  }

  final json = {'name': 'Xyrel', 'age': 18};
  final (:name, :age) = getUserInfo(json);
  print("Name $name Age $age");

  //Set
  // Ignore the Duplicate Value
  Set<int> numbers = {1, 2, 3, 3};
  print(numbers);

  //List
  List<Users> users = [Users("Xyrel", 18)];

  print(users[0].name);
  print(users[0].age);

  while (users.length != 0) {
    print(users[0].age);
    break;
  }
}
