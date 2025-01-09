import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class FromToInputCard extends StatefulWidget {
  final bool isReturn;
  final Function(String from, String to)? onSelect;

   const FromToInputCard({
    super.key,
    this.isReturn = false,
    this.onSelect,
  });

  @override
  State<FromToInputCard> createState() => _FromToInputCardState();
}

class _FromToInputCardState extends State<FromToInputCard> {
   String from = 'Bengaluru';

   String to = 'Dubai';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24.0),
        child: Column(
          children: [
            _buildDropdownInputRow(
              icon: Icons.flight,
              label: 'From',
              value: from,
              iconColor: Colors.green,
              items: ['Bengaluru','Dubai'], // Add your dropdown options here
              onChanged: (value) {
                from = value!;

             widget.onSelect!(from, to);
                setState(() {

                });

              },
            ),
            if (widget.isReturn)
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 32,),
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
            if (widget.isReturn)
              _buildDropdownInputRow(
                icon: Icons.location_on,
                label: 'To',
                value: to,


                iconColor: Colors.green,
                items: ['Bengaluru','Dubai'], // Add your dropdown options here
                onChanged: (value) {
to = value!;
widget.onSelect!(from, to);

setState(() {

});
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
    required String value,
    required Color iconColor,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return SizedBox(height: 20,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButton<String>(

              //
              // decoration: const InputDecoration(
              //   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              //
              //
              // ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      isDense: true,

            isExpanded: true,
              underline: SizedBox(),
              value: value,
              hint: Text(
                label,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              items: items
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
