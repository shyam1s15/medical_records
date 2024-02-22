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

  static String getOpdTypeInString(int findKey) {
    Map<String, int> map = {
      'Full Opd': 0,
      'Half Opd': 1,
      'No Opd': 2,
    };
    return map.keys
        .firstWhere((key) => map[key] == findKey, orElse: () => 'Full Opd');
  }
}
