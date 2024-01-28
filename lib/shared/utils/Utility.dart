class Utility {
  static bool isNullOrPositive(int? d) {
    return d != null && d > 0 ? true : false;
  }

  static bool equalIgnoreCase(String? a, String? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.toLowerCase() == b.toLowerCase();
  }
}
