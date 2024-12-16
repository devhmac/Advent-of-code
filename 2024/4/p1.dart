import 'dart:convert';
import 'dart:io';
import '../utils.dart';

final filePath = './4/input.txt';

main() {
  int result = 0;
  List<List<String>> grid = _parseGrid();

  for (int row = 0; row < grid.length; row++) {
    for (int col = 0; col < grid[row].length; col++) {
      print(
          '------- NEW POSITION ------ [$row, $col], root letter: ${grid[row][col]}');

      directions.forEach((direction) {
        print("----- NEW DIRECTION: $direction ------");
        if (_checkDirection(
            grid: grid,
            rowIndex: row,
            colIndex: col,
            dRow: direction[0],
            dCol: direction[1])) {
          print(result);
// Every direction with a matching XMAS increment
          result++;
        }
      });
    }
  }
  print(result);
  return result;
}

List<List<String>> _parseGrid() {
  List<String> input = getLineSplitInput(path: filePath);
  List<List<String>> grid = input.map((row) => row.split('')).toList();
  return grid;
}

_checkDirection({
  required List<List<String>> grid,
  required int rowIndex,
  required int colIndex,
  required int dRow,
  required int dCol,
}) {
  List<String> word = 'XMAS'.split('');

  // finalreversed = word.reversed.toList();
  // bool isMatched = false;
  //for every letter in xmas, check that many characters from current
  for (int i = 0; i < word.length; i++) {
    String letterToMatch = word[i];

    print('XMAS - position $i, letter ${letterToMatch}');
    int newRow = rowIndex + (i * dRow);
    int newCol = colIndex + (i * dCol);

    String? gridLetter =
        _isInBounds(grid, newRow, newCol) ? grid[newRow][newCol] : null;

    print('checking position [$newRow,$newCol],');
    print('gridletter: ${gridLetter != null ? gridLetter : 'OUTOFBOUNDS'}');
    print("${gridLetter == letterToMatch ? '--- MATCH ---' : '--- FAIL ---'}");

    if (gridLetter == null || gridLetter != letterToMatch) return false;
  }
  return true;
}

bool _isInBounds(List<List<String>> grid, int row, int col) {
  return row >= 0 && row < grid.length && col >= 0 && col < grid[row].length;
}

const directions = [
  [0, 1],
  [0, -1],
  [1, 0],
  [-1, 0],
  [1, 1],
  [1, -1],
  [-1, 1],
  [-1, -1]
];
