class User {
  final String name;
  final int age;
  final String address;

  User(this.name, this.age, this.address);

  @override
  String toString() {
    return 'User{name: $name, age: $age, address: $address}';
  }
}
