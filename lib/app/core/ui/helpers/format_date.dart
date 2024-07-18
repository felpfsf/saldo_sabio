import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final dateFormat = DateFormat('dd/MM/yyyy');
  return dateFormat.format(date);
}
