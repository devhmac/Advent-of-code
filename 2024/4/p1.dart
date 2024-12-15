import 'dart:convert';
import 'dart:io';
import '../utils.dart';

const String word = 'XMAS';
main() {
  int result = 0;
  List<List<String>> grid = _parseGrid();

  for (int row = 0; row < grid.length; row++) {
    for (int col = 0; col < grid[row].length; col++) {
      _checkDirection(
          grid: grid, rowIndex: row, colIndex: col, dRow: 1, dCol: 1);
    }
  }
  return result;
}

List<List<String>> _parseGrid() {
  List<String> input = getLineSplitInput(path: './4/example.txt');
  List<List<String>> grid = input.map((row) => row.split('')).toList();
  return grid;
}
// Loop through grid

/// Check all 8 surrounding dirs
///   - check boundaries
///       - if row 1 no up, if row last, no down, left/right
/// if all 4 characters in xmas exist - final check
_checkDirection({
  required List<List<String>> grid,
  required int rowIndex,
  required int colIndex,
  required int dRow,
  required int dCol,
}) {
  //for every letter in xmas, check that many characters from current
  for (int i = 0; i < word.length; i++) {
    int newRow = rowIndex + i * dRow;
    int newCol = colIndex + i * dCol;

    if (_isInBounds(grid, newRow, newCol) && grid[newRow][newCol] == word[i]) {
      print('current position [$rowIndex,$colIndex]');
      print('in bounds [$newRow,$newCol]');
      print(grid[newRow][newCol]);
    }
  }
  // if row is 0, dont check up (row-1)
// if row is end dont check down (row + 1)
// if letter is start, dont check left (up or down)
// if letter is end, dont check right (up or down)
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

// then cound number of occurances
