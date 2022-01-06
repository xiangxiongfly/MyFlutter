// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student({
    required this.name,
    required this.age,
    required this.address,
  });

  String name;
  int age;
  String address;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    name: json["name"],
    age: json["age"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "address": address,
  };

  @override
  String toString() {
    return 'Student{name: $name, age: $age, address: $address}';
  }
}
