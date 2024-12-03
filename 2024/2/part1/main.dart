import 'dart:convert';

import '../../utils.dart';

// Report safe if
// The levels are either all increasing or all decreasing.
// Any two adjacent levels differ by at least one and at most three.

// return count of safe reports

String input = getinput(path: '2/part1/input.txt');
// String input = getinput(path: '2/part1/example.txt');
const splitter = LineSplitter();

enum IncOrDec { increment, decrement }

bool _checkSafety(IncOrDec direction, int current, int next) {
  if (direction == IncOrDec.increment &&
      (next > current && next <= current + 3)) {
    return true;
  }
  if (direction == IncOrDec.decrement &&
      (next < current && next >= current - 3)) {
    return true;
  }
  return false;
}

void main() {
// split reports on lines and  ' '
// loop through each report and determine if safe
//    - if i+1 (or 1 back) +/- 1-3, first comparison gets to check if we're incrementing or decrementing

// increment safe count
  List<List<String>> reports =
      splitter.convert(input).map((item) => item.split(' ')).toList();
  int safeCount = 0;
  reports.forEach((report) {
    bool isSafe = true;
    final lastElement = report.length - 1;
    late IncOrDec direction;
    for (int i = 0; i < report.length; i++) {
      if (isSafe == false) return;
      final currentElement = int.parse(report[i]);
      final nextElement = int.parse(report[i + 1]);
      if (i + 1 == lastElement &&
          _checkSafety(direction, currentElement, nextElement)) {
        safeCount++;
        // final check and determine safety
        return;
      }
      // eliminate if out of bounds
      if ((nextElement > currentElement + 3 ||
          nextElement < currentElement - 3)) {
        isSafe = false;
        return;
      }

      // first item determines inc or dec
      if (i == 0) {
        direction = nextElement > currentElement
            ? IncOrDec.increment
            : IncOrDec.decrement;
      }
      if ((direction == IncOrDec.increment && nextElement < currentElement) ||
          direction == IncOrDec.decrement && nextElement > currentElement) {
        isSafe = false;
        return;
      }

      if (!_checkSafety(direction, currentElement, nextElement)) {
        isSafe = false;
        return;
      }
    }
  });

  print(safeCount);
}
