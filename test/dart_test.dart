import 'dart:convert';
import 'computer.dart';

void main() {
  print("Hello World");
  var computer = new Computer("HA", "HI");
  String json = jsonEncode(computer);
  print(json);
}
