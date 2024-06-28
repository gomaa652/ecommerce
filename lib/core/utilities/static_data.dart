class StaticData {
  static String token = '';
  static String userId = '';
  static bool isAuth = false;

  static capitalizeEachWord(String test) {
    if (test.isEmpty) {
      return '';
    }
    var x = test.split(' ').map((word) {
      if (word.trim().isEmpty) {
        return '';
      }
      if (word.length > 0) {
        return word[0].toUpperCase() + word.substring(1);
      }
    }).join(' ');
    return x;
  }
}
