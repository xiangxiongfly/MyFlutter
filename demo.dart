main() {
  var result = 10.5.clamp(5, 10.0); // 10.0
  print(result);
  result = 0.75.clamp(5, 10.0); // 5
  print(result);
  result = (-10).clamp(-5, 5.0); // -5
  print(result);
  result = (-0.0).clamp(-5, 5.0); // -0.0
  print(result);
}
