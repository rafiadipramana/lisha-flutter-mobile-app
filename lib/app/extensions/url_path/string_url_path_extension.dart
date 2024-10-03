extension StringUrlPathExtension on String {
  String get fileName => split('/').last;
  String get fileNameOnly => fileName.split('.').first;
  String get fileExtension => split('.').last;
}