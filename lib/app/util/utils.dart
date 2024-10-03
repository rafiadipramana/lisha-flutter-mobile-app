class Utils {
  static String getImagePath(String imageName, {String imageFormat = 'png'}) {
    return 'assets/images/$imageName.$imageFormat';
  }
}