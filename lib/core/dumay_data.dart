// Dummy Flight Data
import '../project/search_result/presentation/widgets/flight_details_card.dart';
import 'cont/image.dart';

final List<FlightDetailsCard> dummyFlights = List.generate(
  8,
      (index) => FlightDetailsCard(
    airlineName: 'Garuda Indonesia',
    airlineIcon: AppImages.wing,
    departureTime: '0${index + 1}:00 AM',
    departureCode: 'BLR',
    departureCity: 'Bengaluru',
    arrivalTime: '0${index + 3}:00 PM',
    arrivalCode: 'DXB',
    arrivalCity: 'Dubai',
    duration: '${index + 2}h ${index * 10}m',
    stops: index+2,
    price: 100.0 + (index * 50),
    tags: index % 2 == 0 ? ['Cheapest', 'Refundable'] : ['Refundable'],
  ),
);
