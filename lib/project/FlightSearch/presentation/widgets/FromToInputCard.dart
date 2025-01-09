import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../manager/flight_search_cubit.dart';

class FromToInputCard extends StatelessWidget {
  FromToInputCard(
      {super.key,
      this.onSelectFromLocation,
      this.onSelectToLocation,
      this.isOneWay=true,
      required this.fromLocation,
      required this.toLocation});
  Function(String)? onSelectFromLocation;
  Function(String)? onSelectToLocation;
  late String fromLocation;
  late String toLocation;
  late bool isOneWay;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Container(
        height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20.0),
        child: Column(
          children: [
            _buildDropdownInputRow(
              icon: Icons.flight,
              label: 'From',
              isEnabled: true,
              value: fromLocation, // Fix 1
              iconColor: Colors.green,
              items: const ['Bengaluru', 'Dubai'], // Fix 2: Made list const
              onChanged: (value) {
                // Fix 3: Proper callback handling
                fromLocation = value!;
                onSelectFromLocation!(value);
              },
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 32),
                  width: 252,
                  height: 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary2,
                        AppColors.grey10.withOpacity(0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green.withOpacity(0.1),
                    child: const Icon(
                      Iconsax.arrow_swap,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            _buildDropdownInputRow(
              icon: Icons.location_on,
              label: 'To',
              isEnabled: !isOneWay,
              value: toLocation, // Fix 1
              iconColor: Colors.green,
              items: const ['Bengaluru', 'Dubai'], // Fix 2: Made list const
              onChanged: (value) {
                toLocation = value!;
                // Fix 3: Proper callback handling
                onSelectToLocation!(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownInputRow({
    required IconData icon,
    required String label,
    required bool isEnabled,
    required String? value, // Fix 4: Made value nullable
    required Color iconColor,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Icon(
            icon,
            color: isEnabled?iconColor:AppColors.gray,
            size: 20,
          ),
          const SizedBox(width: 8),
         
          Expanded(
            child: DropdownButton<String>(


              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              isDense: true,

              isExpanded: true,
              underline: const SizedBox(), // Fix 5: Made const
              value: isEnabled?value:null,
              hint: Text(
                label,
                style:  TextStyle(
                  color:isEnabled? AppColors.textSecondary:AppColors.gray,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              items:!isEnabled?[]: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
