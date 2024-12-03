import 'dart:io';

String getinput({required String path}) {
  File input = new File(path);

  return input.readAsStringSync();
}
