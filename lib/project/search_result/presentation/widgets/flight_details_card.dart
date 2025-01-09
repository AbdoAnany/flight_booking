// lib/presentation/widgets/flight_details_card.dart
import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flight_booking_app/core/theme/app_typography..dart';
import 'package:flutter/material.dart';

class FlightDetailsCard extends StatelessWidget {
  final String airlineName;
  final String airlineIcon;
  final String departureTime;
  final String departureCode;
  final String departureCity;
  final String arrivalTime;
  final String arrivalCode;
  final String arrivalCity;
  final String duration;
  final int stops;
  final double price;
  final bool isReturn;
  final List<String> tags;

  const FlightDetailsCard({
    required this.airlineName,
    required this.airlineIcon,
    required this.departureTime,
    required this.departureCode,
    required this.departureCity,
    required this.arrivalTime,
    required this.arrivalCode,
    required this.arrivalCity,
    required this.duration,
    required this.stops,
    required this.price,
    this.isReturn = false,
    this.tags = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,
            vertical: 16),
        child: Column(
          children: [
            // Flight Header
            Row(
              children: [
                // Airline Logo
                Image.asset(
                  airlineIcon,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.flight,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                // Airline Name
                Text(
                   'Onward - $airlineName',
                  style: AppTypography.bodyText5
                ),
                const Spacer(),
                // Price
                Text(
                  'AED ${price.toStringAsFixed(0)}',
                  style:AppTypography.headline4
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Flight Details
            Row(
              children: [
                // Departure Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        departureTime,
                        style: AppTypography.headline5
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$departureCode - $departureCity',
                          style: AppTypography.caption2


                      ),
                    ],
                  ),
                ),
                // Flight Path
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: CustomPaint(
                              size: const Size(double.infinity, 2),
                              painter: DashedLinePainter(),
                            ),
                          ),
                          Transform.rotate(
                            angle: .5 * 3.14,
                            child: const Icon(
                              Icons.flight,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        duration,
                          style: AppTypography.bodyText5
                      ),
                      Text(
                        '$stops Stops',
                          style: AppTypography.caption2
                      ),
                    ],
                  ),
                ),
                // Arrival Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        arrivalTime,
                          style: AppTypography.headline5
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$arrivalCode - $arrivalCity',
                          style: AppTypography.caption2
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            const SizedBox(height: 16),
            Row(
              children: [
                // Airline Logo
                Image.asset(
                  airlineIcon,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.flight,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                // Airline Name
                Text(
                    'Return - $airlineName',
                    style: AppTypography.bodyText5
                ),
                const Spacer(),
                // Price
                Text(
                    'AED ${price.toStringAsFixed(0)}',
                    style:AppTypography.headline4
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Flight Details
            Row(
              children: [
                // Departure Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          departureTime,
                          style: AppTypography.headline5
                      ),
                      const SizedBox(height: 4),
                      Text(
                          '$departureCode - $departureCity',
                          style: AppTypography.caption2


                      ),
                    ],
                  ),
                ),
                // Flight Path
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: CustomPaint(
                              size: const Size(double.infinity, 2),
                              painter: DashedLinePainter(),
                            ),
                          ),
                          Transform.rotate(
                            angle: .5 * 3.14,
                            child: const Icon(
                              Icons.flight,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                          duration,
                          style: AppTypography.bodyText5
                      ),
                      Text(
                          '$stops Stops',
                          style: AppTypography.caption2
                      ),
                    ],
                  ),
                ),
                // Arrival Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          arrivalTime,
                          style: AppTypography.headline5
                      ),
                      const SizedBox(height: 4),
                      Text(
                          '$arrivalCode - $arrivalCity',
                          style: AppTypography.caption2
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (tags.isNotEmpty) ...[
              // Tags
              Row(
                children: [
                  ...tags.map((tag) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _buildTagChip(
                    tag,

                        tag == 'Cheapest'
                            ? Colors.green
                            : Colors.blue

                    ),
                  )),
                  Spacer(),

                  InkWell(
                    onTap: () {
                      // Handle flight details tap
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Flight Details',
                          style: TextStyle(
                            color: Colors.orange[700],
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.orange[700],
                        ),
                      ],
                    ),
                  ),
                ],


              ),
            ],
            // Flight Details Button

          ],
        ),
      ),
    );
  }
}

_buildTagChip(String tag,MaterialColor color) {

  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 2,
    ),
    decoration: BoxDecoration(
      color: color[50],
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color:color[300]!
      ),
    ),
    child: Text(
      tag,
      style: TextStyle(
        fontSize: 9,
        color: color[700]
      ),
    ),
  );
}

// Custom painter for dashed line
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gray
      ..strokeWidth = 1;

    const dashWidth = 2;
    const dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 4),
        Offset(startX + dashWidth, size.height / 4),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Usage example:
