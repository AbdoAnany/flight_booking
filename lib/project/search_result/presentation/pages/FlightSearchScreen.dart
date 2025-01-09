import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/FromToInputCard.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/flight_hotel_package_card.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/search_form.dart';
import 'package:flight_booking_app/project/home/presentation/widgets/travel_inspiration_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/cont/image.dart';
import '../../../../core/theme/app_typography..dart';
import '../widgets/flight_details_card.dart';
import '../widgets/flight_search_header.dart';


class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<SearchForm>with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  final List<String> tabs = ['Round Trip', 'One Way', 'Multi City'];
  onNavigateToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchForm()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48, toolbarHeight: 76,

        // backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Ezy Travel', style: AppTypography.bodyText2),

      ),
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

            SizedBox(height: 32),
            FlightDetailsCard(
              airlineName: 'Garuda Indonesia',
              airlineIcon: 'assets/garuda_logo.png',
              departureTime: '14:35',
              departureCode: 'BLR',
              departureCity: 'Bengaluru',
              arrivalTime: '21:55',
              arrivalCode: 'DXB',
              arrivalCity: 'Dubai',
              duration: '4h 30m',
              stops: 2,
              price: 409,
              tags: const ['Cheapest', 'Refundable'],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTripTypeButton(String label, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {
        // Handle trip type selection
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey,
      ),
      child: Text(label),
    );
  }
  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;
    return Tab(
      child: Container(
        // width: 132,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.text,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget _buildLocationField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDateField(String label, String date) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      controller: TextEditingController(text: date),
      readOnly: true,
      onTap: () {
        // Handle date picker
      },
    );
  }

  Widget _buildTravelersField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Travelers',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.person),
      ),
      controller: TextEditingController(text: '1 Passenger'),
      readOnly: true,
      onTap: () {
        // Handle travelers selection
      },
    );
  }

  Widget _buildCabinClassField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Cabin Class',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.airline_seat_recline_normal),
      ),
      controller: TextEditingController(text: 'Economy Class'),
      readOnly: true,
      onTap: () {
        // Handle cabin class selection
      },
    );
  }
}

// lib/presentation/widgets/flight_hotel_package_card.dart
