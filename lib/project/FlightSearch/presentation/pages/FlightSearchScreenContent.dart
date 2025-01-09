import 'package:flight_booking_app/core/utils/widget/app_bar.dart';
import 'package:flight_booking_app/project/FlightSearch/presentation/manager/flight_search_cubit.dart';
import 'package:flight_booking_app/project/FlightSearch/presentation/widgets/header_searching_fling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cont/image.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/widget/title_header.dart';
import '../../../search_result/presentation/pages/FlightSearchScreen.dart';
import '../widgets/FromToInputCard.dart';
import '../widgets/flight_hotel_package_card.dart';
import '../widgets/search_form.dart';
import '../widgets/travel_inspiration_card.dart';

class FlightSearchScreenContent extends StatelessWidget {
  const FlightSearchScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FlightSearchCubit>();

    return Scaffold(
      appBar: const MyAppBar(title: 'Search Flights'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSearchFling(),

            SizedBox(
              height: 35,
            ),
            // FromToInputCard
            BlocBuilder<FlightSearchCubit, FlightSearchState>(
              builder: (context, state) {
                return FromToInputCard(
                  onSelectFromLocation: cubit.setTravelFromLocation,
                  onSelectToLocation: cubit.setTravelToLocation,
                  fromLocation: state.fromLocation,
                  toLocation: state.toLocation,
                  isOneWay:  state.tripType=='One Way'
                );
              },
            ),
            const SizedBox(
              height: 35,
            ),
            // Date Picker Fields
            BlocBuilder<FlightSearchCubit, FlightSearchState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: DatePickerField(
                          label: 'Departure',
                          value: DateFormatter.formatFlightDate(state.departureDate),
                          onSelect: cubit.setDepartureDate,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DatePickerField(
                          label: 'Return',
                          value: state.returnDate != null
                              ? DateFormatter.formatFlightDate(
                                  state.returnDate!)
                              : '',
                          enabled: state.tripType != 'One Way',
                          onSelect: cubit.setReturnDate,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 19,
            ),
            // Travelers and Cabin Class Dropdowns
            BlocBuilder<FlightSearchCubit, FlightSearchState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SelectorDropdown(
                          label: 'Travelers',
                          value: state.travelers,
                          items: [
                            '1 Passenger',
                            '2 Passengers',
                            '3 Passengers',
                            '4 Passengers'
                          ],
                          onChanged: cubit.setTravelers,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SelectorDropdown(
                          label: 'Cabin Class',
                          value: state.cabinClass,
                          items: [
                            'Economy Class',
                            'Business Class',
                            'First Class'
                          ],
                          onChanged: cubit.setCabinClass,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 19,
            ),
            // Search Button
            Center(
              child: ElevatedButton(
                onPressed: () => context
                    .read<FlightSearchCubit>()
                    .onNavigateToSearch(context),
                child: const Text('Search Flights'),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            // Travel Inspirations
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleHeader(title: 'Travel Inspirations'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        TravelInspirationCard(
                          image: AppImages.saudiArabia,
                          title: 'Saudi Arabia',
                        ),
                        TravelInspirationCard(
                          image: AppImages.kuwait,
                          title: 'Kuwait',
                        ),
                        TravelInspirationCard(
                          image: AppImages.saudiArabia,
                          title: 'Saudi Arabia',
                        ),
                        TravelInspirationCard(
                          image: AppImages.kuwait,
                          title: 'Kuwait',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: FlightHotelPackageCard(),
            ),
          ],
        ),
      ),
    );
  }
}
