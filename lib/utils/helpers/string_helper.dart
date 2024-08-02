import 'package:intl/intl.dart';

class StringHelper {
  static String getBatchNo(String? productName, DateTime? date) {
    if (productName == null || date == null || productName.length < 2)
      return '';
    final prefix = productName.substring(0, 2).toUpperCase();
    final suffix = DateFormat('ddMMyy').format(date);

    return '$prefix$suffix';
  }
}
