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
  // File input = new File('1/exampleInput.txt');
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

void _freqCount(key, Map hashMap) {
  hashMap[key] = (hashMap[key] ?? 0) + 1;
}

const splitter = LineSplitter();
main() async {
  Map<int, int> hash1 = {};
  Map<int, int> hash2 = {};
  List<int> l1 = [];
  List<int> l2 = [];
  int result = 0;

  splitter.convert(input).forEach((item) {
    final trimmed = item.trim().split(' ');
    final int l1Loc = int.parse(trimmed[0]);
    final int l2Loc = int.parse(trimmed[trimmed.length - 1]);

    _freqCount(l1Loc, hash1);
    _freqCount(l2Loc, hash2);

    _sortPush(l1Loc, l1);
    _sortPush(l2Loc, l2);
  });

  for (int i = 0; i < l1.length; i++) {
    final rightMatchCount = hash2[l1[i]];
    if (rightMatchCount != null) {
      result += (l1[i] * rightMatchCount);
    }
  }
  print(result);
}
