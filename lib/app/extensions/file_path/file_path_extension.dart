import 'dart:io';

extension FilePathExtension on File {
  String get fileName => path.split('/').last;
  String get fileExtension => path.split('.').last;
}