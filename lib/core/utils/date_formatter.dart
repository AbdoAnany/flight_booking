import 'package:intl/intl.dart';

class DateFormatter {
  static String formatFlightDate(DateTime date) {
    String dayName = DateFormat('E').format(date).substring(0, 3); // Get first 3 letters of day
    String dayNumber = DateFormat('d').format(date);
    String month = DateFormat('MMM').format(date);
    String year = DateFormat('y').format(date);
    
    return '$dayName, $dayNumber $month - $year';
  }
  static String formatTime(int hour) {
    final isPM = hour >= 12;
    final formattedHour = hour % 12 == 0 ? 12 : hour % 12; // Handle 12-hour format.
    final period = isPM ? 'PM' : 'AM';

    return '${formattedHour.toString().padLeft(2, '0')}:00 $period';
  }

}