import 'package:flutter/material.dart';

import '../../../../core/dumay_data.dart';
import '../../../../core/theme/app_typography..dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/widget/app_bar.dart';
import '../../../../core/utils/widget/title_header.dart';
import '../../../FlightSearch/presentation/manager/flight_search_cubit.dart';
import '../widgets/flight_search_header.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key, required this.flightSearchState});
  final FlightSearchState flightSearchState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Ezy Travel',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            FlightSearchHeader(
              origin: 'BLR - ${flightSearchState.fromLocation}',
              destination: 'DXB - ${flightSearchState.toLocation}',
              tripType: '${flightSearchState.tripType}',

              departureDate: DateFormatter.formatFlightDate(flightSearchState.departureDate),
              returnDate: DateFormatter.formatFlightDate(flightSearchState.returnDate ?? DateTime.now()),
            ),
            TitleHeader(title: "${dummyFlights.length} Flight Found"),

            ...dummyFlights
          ],
        ),
      ),
    );
  }
}
