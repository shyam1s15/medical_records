import 'package:intl/intl.dart';

// Thu, 08 Feb 2024 00:00:00 GMT
class DateField {
  final String format;

  const DateField({this.format = 'EEE, dd MMM yyyy HH:mm:ss zzz'});

  DateTime parse(String value) {
    return DateFormat(format).parse(value);
  }
}
