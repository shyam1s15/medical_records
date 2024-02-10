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

  static bool nonNullNonEmpty(List<dynamic>? list) {
    return list != null && list.length > 0;
  }

  static String appDisplayDate(DateTime dateTime) {
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    
    return '$day/ $month/ $year';
  }
}
