import 'package:flutter/material.dart';

import '../../../../core/cont/image.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_typography..dart';

class FlightHotelPackageCard extends StatelessWidget {
  const FlightHotelPackageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Flight & Hotel Packages',
          style:AppTypography.bodyText3
        ),
        const SizedBox(height: 16),
        Container(
          height: 313,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: AssetImage(AppImages.offer),
              fit: BoxFit.cover,
            ),
          ),

        ),
      ],
    );
  }
}