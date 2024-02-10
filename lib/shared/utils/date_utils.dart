import 'package:intl/intl.dart';

class DateUtil {
  static String appDisplayDate(DateTime d) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(d);
    return formattedDate;
  }

  static String appBackendDate(DateTime d) {
    String formattedDate =
        DateFormat('EEE, dd MMM yyyy HH:mm:ss \'GMT\'').format(d);
    return formattedDate;
  }

  static DateTime appDateTimeFromString(String s) {
    String format = 'EEE, dd MMM yyyy HH:mm:ss zzz';
    return DateFormat(format).parse(s); 
  }
}
