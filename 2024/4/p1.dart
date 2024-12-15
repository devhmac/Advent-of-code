import 'dart:io';

String get input {
  File input = new File('1/input.txt');
  // File input = new File('1/exampleInput.txt');
  return input.readAsStringSync();
}
