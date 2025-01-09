// Dummy Flight Data
import 'package:flight_booking_app/core/utils/date_formatter.dart';

import '../project/search_result/presentation/widgets/flight_details_card.dart';
import 'cont/image.dart';

final List<FlightDetailsCard> dummyFlights = List.generate(
  8,
      (index) => FlightDetailsCard(
    airlineName: 'Garuda Indonesia',
    airlineIcon: AppImages.wing,
    departureTime: DateFormatter.formatTime(index + 1) ,
    departureCode: 'BLR',
    departureCity: 'Bengaluru',
    arrivalTime: DateFormatter.formatTime(index + 3) ,
    arrivalCode: 'DXB',
    arrivalCity: 'Dubai',
    duration: '${index + 2}h ${index * 10}m',
    stops: index+2,
    price: 100.0 + (index * 50),
    tags: index % 2 == 0 ? ['Cheapest', 'Refundable'] : ['Refundable'],
  ),
);
final List<String> tabs = ['Round Trip', 'One Way', 'Multi City'];
