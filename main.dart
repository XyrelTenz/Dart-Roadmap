// import "dart:io";
import "DataStructureAndAlgorithm/Fibonacci.dart";

import "EnumConstant/EnumConstant.dart";

class Student<T> {
  T value;

  Student(this.value);
}

void main() {
  // stdout.write("Enter Number: ");
  // int? number = int.tryParse(stdin.readLineSync()!);

  // print(number);
  Student student = Student(10);
  print(student.value);

  print(Fibonacci(10));
  print("Hello World");
}
