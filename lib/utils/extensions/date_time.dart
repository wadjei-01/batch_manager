import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toStringFormat() {
    return DateFormat('E d MMM, yyyy').format(this);
  }
}
