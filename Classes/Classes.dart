/*
  Concept: Classes & Object-Oriented Programming
  Dart Docs: https://dart.dev/guides/language/language-tour#classes

  Description:
  Dart is object-oriented. Classes define objects, support constructors,
  inheritance, mixins, and encapsulation. Named constructors help initialize objects in multiple ways.

  Importance for Flutter:
  Widgets are classes. Custom widgets and models rely on OOP concepts.

  Use Cases in Flutter:
  - Custom StatefulWidget or StatelessWidget
  - Model classes for API responses
  - Reusable component classes
*/

class Student {
  String name;
  int age;

  Student(this.name, this.age);

  void showInfo() {
    print("$name is $age years old.");
  }

  // Named constructor
  Student.fromMap(Map<String, dynamic> map)
    : name = map['name'],
      age = map['age'];
}

class Teacher extends Student {
  String subject;
  Teacher(String name, int age, this.subject) : super(name, age);

  @override
  void showInfo() {
    super.showInfo();
    print("Teaches $subject");
  }
}

void main() {
  Student s = Student("Xyrel", 18);
  s.showInfo();

  Student s2 = Student.fromMap({"name": "Alice", "age": 20});
  s2.showInfo();

  Teacher t = Teacher("Mr. Smith", 30, "Math");
  t.showInfo();

  // Flutter Use Case:
  // Define model class for API response or create custom widget classes
}
