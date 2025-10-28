// import "dart:io";

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
}
