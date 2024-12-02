// locations listed by ID
// compare two lists
// - pair up numbers and measure delta
// - each num unique location

// compare sorted lists (smallest v smallest)
//sum delta
import 'dart:io';
import 'dart:convert';

String get input {
  File input = new File('1/input.txt');
  return input.readAsStringSync();
}

void _sortPush(int num, List<int> array) {
  if (array.isNotEmpty && num < array[0]) {
    return array.insert(0, num);
  }
  for (int i = 0; i < array.length; i++) {
    if (num < array[i]) return array.insert(i, num);
  }
  array.add(num);
}

const splitter = LineSplitter();
main() async {
  List<int> l1 = [];
  List<int> l2 = [];
  int diff = 0;

  splitter.convert(input).forEach((item) {
    final trimmed = item.trim().split(' ');
    _sortPush(int.parse(trimmed[0]), l1);
    _sortPush(int.parse(trimmed[trimmed.length - 1]), l2);
  });

  for (int i = 0; i < l1.length; i++) {
    diff += (l1[i] - l2[i]).abs();
  }
  print(diff);
}
