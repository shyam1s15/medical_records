class ObjectUtil {
  static int optInteger(dynamic value, int defaultValue) {
    if (value == null) {
      return defaultValue;
    } else if (value is int) {
      return value; // If it's already an integer, return it
    } else if (value is String) {
      return int.tryParse(value) ??
          defaultValue; // Try parsing the string to an int, return 0 if parsing fails
    } else {
      return defaultValue; // Return 0 for other types
    }
  }
}
