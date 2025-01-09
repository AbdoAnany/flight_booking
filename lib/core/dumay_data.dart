// Dummy Flight Data
import 'package:flight_booking_app/core/utils/date_formatter.dart';

import '../project/search_result/presentation/widgets/flight_details_card.dart';
import 'cont/image.dart';

DateTime _getTimeFromIndex(int index) {
  // Using a base date (today) and adding hours based on index
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, index + 1);
}

String _calculateDuration(DateTime departure, DateTime arrival) {
  final difference = arrival.difference(departure);
  final hours = difference.inHours;
  final minutes = difference.inMinutes % 60;
  return '${hours}h ${minutes}m';
}

final List<FlightDetailsCard> dummyFlights = List.generate(
  8,
      (index) {
    final departureDateTime = _getTimeFromIndex(index);
    final arrivalDateTime = _getTimeFromIndex(index + 2); // Adding 2 hours for arrival

    return FlightDetailsCard(
      airlineName: 'Garuda Indonesia',
      airlineIcon: AppImages.wing,
      departureTime: DateFormatter.formatTime(departureDateTime.hour),
      departureCode: 'BLR',
      departureCity: 'Bengaluru',
      arrivalTime: DateFormatter.formatTime(arrivalDateTime.hour),
      arrivalCode: 'DXB',
      arrivalCity: 'Dubai',
      duration: _calculateDuration(departureDateTime, arrivalDateTime),
      stops: index + 2,
      price: 100.0 + (index * 50),
      tags: index % 2 == 0 ? ['Cheapest', 'Refundable'] : ['Refundable'],
    );
  },
);final List<String> tabs = ['Round Trip', 'One Way', 'Multi City'];
