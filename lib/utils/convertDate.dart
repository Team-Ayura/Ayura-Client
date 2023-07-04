import 'package:intl/intl.dart';

String convertDate(String inputDate) {
  DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(inputDate);
  String formattedDate =
      DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(parsedDate);

  return formattedDate;
}
