main() {
  String path="/aaab";
  print(getFileName(path));

}


String getFileName(String path) {
  int index = path.lastIndexOf("/");
  if (index <= 0) {
    return path;
  }
  return path.substring(index + 1);
}