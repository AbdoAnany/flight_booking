import 'package:flutter/material.dart';

import '../../../../core/dumay_data.dart';
import '../../../../core/theme/app_typography..dart';
import '../../../../core/utils/widget/app_bar.dart';
import '../../../../core/utils/widget/title_header.dart';
import '../widgets/flight_search_header.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<SearchForm>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      const MyAppBar(
        title: 'Ezy Travel',),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            const FlightSearchHeader(
              origin: 'BLR - Bengaluru',
              destination: 'DXB - Dubai',
              departureDate: 'Sat, 23 Mar',
              returnDate: 'Sat, 23 Mar',
            ),
            TitleHeader(title: "${dummyFlights.length} Flight Found"),

            ...dummyFlights
          ],
        ),
      ),
    );
  }
}
