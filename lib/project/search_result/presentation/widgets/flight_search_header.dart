// lib/presentation/widgets/flight_search_header.dart
import 'dart:ui';

import 'package:flight_booking_app/core/theme/app_typography..dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class FlightSearchHeader extends StatefulWidget {
  final String origin;
  final String destination;
  final String tripType;
  final String departureDate;
  final String returnDate;
  // final Function(DateRange) onDateRangeChanged;

  const FlightSearchHeader({
    required this.origin,
    required this.destination,
    required this.tripType,
    required this.departureDate,
    required this.returnDate,
    // required this.onDateRangeChanged,
    super.key,
  });

  @override
  State<FlightSearchHeader> createState() =>
      _FlightSearchHeaderState();
}



class _FlightSearchHeaderState extends State<FlightSearchHeader> {
  int selectedDateRange = 1; // Default to middle option

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Route and Trip Info
        Card(
          margin: const EdgeInsets.all(16),
          color: Colors.white,
          elevation: 5,
          child: Container(
            height: 145,
            padding: const EdgeInsets.symmetric(horizontal: 16.0,
                vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Route Title
                Text(
                  '${widget.origin} - ${widget.destination}',
                  style: AppTypography.headline3
                ),
                SizedBox(height: 4,),

                // Date Info
                Text(
                  'Departure: ${widget.departureDate} - Return: ${widget.returnDate}',
                  style: AppTypography.caption3
                ),
                SizedBox(height: 4,),
                // Trip Type and Modify
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      '(${widget.tripType})',
                      style: AppTypography.bodyText4.copyWith(
                        color: Colors.orange
                      )
                    ),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: const Text(
                          'Modify Search',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(height: 8,),
SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    _buildFilterChip(
                        'Sort',Icons.keyboard_arrow_down
                    ),

                    const Spacer(),

                    _buildFilterChip(
                      'Non - Stop',null
                    ),

                    const Spacer(),

                    _buildFilterChip(
                        'Filter',
                        Icons.tune
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        // Sort and Filter Bar

        // Date Range Selection
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: Colors.grey[50],
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 16),
                _buildDateRangeChip(
                  0,
                  'Mar 22 - Mar 23',
                  'From AED 741',
                ),
                const SizedBox(width: 8),
                _buildDateRangeChip(
                  1,
                  'Mar 23 - Mar 24',
                  'From AED 721',
                ),
                const SizedBox(width: 8),
                _buildDateRangeChip(
                  2,
                  'Mar 24 - Mar 25',
                  'From AED 750',
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildFilterChip(String label,IconData? icon){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(label,
          style: AppTypography.bodyText4.copyWith(
            color: AppColors.black
          )
        ),SizedBox(width: 4,),
        Icon(icon,color: AppColors.black,),
      ],
    );
  }

  Widget _buildDateRangeChip(int index, String dates, String price) {
    final isSelected = selectedDateRange == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedDateRange = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              dates,
              style: AppTypography.caption2
            ),
            const SizedBox(height: 4),
            Text(
              price,
                style: AppTypography.caption2
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example:
