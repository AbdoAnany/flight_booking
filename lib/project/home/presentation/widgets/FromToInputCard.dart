import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FromToInputCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24.0),
        child: Column(
          children: [
            _buildInputRow(
              icon: Icons.flight,
              label: 'From',
              iconColor: Colors.green,
            ),
            Row(
              children: [

                Container(
                  margin: EdgeInsets.only(left: 32),
                  width:252 ,height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: LinearGradient(colors:
                  [
                  AppColors.primary2,
                    AppColors.grey10.withOpacity(0)

                  ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  )
                ),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.green.withOpacity(0.1),
                  child: Icon(
                    Iconsax.arrow_swap
                    ,
                    color: Colors.green,
                    size: 16,
                  ),
                ),
              ],
            ),
            _buildInputRow(
              icon: Icons.location_on,
              label: 'To',
              iconColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow({
    required IconData icon,
    required String label,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),

      ],
    );
  }
}
