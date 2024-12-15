import 'dart:convert';
import 'dart:io';

const splitter = LineSplitter();

String getInput({required String path}) {
  String input = new File(path).readAsStringSync();
  return input;
}

List<String> getLineSplitInput({required String path}) {
  String input = new File(path).readAsStringSync();
  return splitter.convert(input);
}
