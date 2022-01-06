import 'dart:convert';

/// name : "小明"
/// age : 18
/// address : "beijing"

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    String? name,
    int? age,
    String? address,
  }) {
    _name = name;
    _age = age;
    _address = address;
  }

  Student.fromJson(dynamic json) {
    _name = json['name'] as String;
    _age = json['age'];
    _address = json['address'];
  }

  String? _name;
  int? _age;
  String? _address;

  String? get name => _name;

  int? get age => _age;

  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['age'] = _age;
    map['address'] = _address;
    return map;
  }

  @override
  String toString() {
    return 'Student{_name: $_name, _age: $_age, _address: $_address}';
  }
}
