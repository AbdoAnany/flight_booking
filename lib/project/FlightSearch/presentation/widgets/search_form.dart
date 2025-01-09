// lib/presentation/widgets/date_picker_field.dart
import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flight_booking_app/core/theme/app_typography..dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/date_formatter.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  String? value;
  final Function(DateTime) onSelect;
  final bool enabled;

  DatePickerField({
    required this.label,
    this.value,
    required this.onSelect,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(  color:!enabled?  AppColors.gray: AppColors.border),
        borderRadius: BorderRadius.circular(6),
      ),height: 54,
      child: InkWell(
        onTap:enabled ? () => _showDatePicker(context) : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,
              vertical: 4),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Positioned(
                    top: -25,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 2,
                          vertical: 2),
                      decoration: BoxDecoration(
                        color:!enabled?  AppColors.gray:
                        AppColors.secondaryLight
                        ,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                         label,
                          style: AppTypography.caption2.copyWith(
                            color:!enabled?
                            AppColors.border:
                            AppColors.text,)

                      ),
                    ),
                  ),
                  Text(

                   value ?? 'Select Date',
                    style: AppTypography.bodyText4.copyWith(  color:!enabled?
                    AppColors.gray:
                    AppColors.text,
                    ),)
                ],
              ),
              const Spacer(),
              Icon(
                Iconsax.calendar_1,
                size: 20,
                color:!enabled?  AppColors.gray: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
     onSelect(date);
    }
   value=   DateFormatter.formatFlightDate(
        date?? DateTime.now()
    ) ;
    // setState(() {
    //
    // });
  }
}




class SelectorDropdown extends StatelessWidget {
  final String label;
  String? value;
  final bool enabled;
  final List<String> items;
  final void Function(String?) onChanged;

  SelectorDropdown({
    required this.label,
    this.value,
    required this.items,
    required this.onChanged,
    this.enabled = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        border: Border.all(
          color: !enabled ? AppColors.gray : AppColors.border,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -12,left: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                color: !enabled ? AppColors.gray : AppColors.secondaryLight,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                label,
                style: AppTypography.caption2.copyWith(
                  color: !enabled ? AppColors.border : AppColors.text,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: value,
                items: items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: AppTypography.bodyText4.copyWith(
                        color: !enabled ? AppColors.gray : AppColors.text,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: enabled ? (e){
                value=e;
                onChanged(e);
                  // setState(() {
                  //
                  // });
                } : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class SelectorDropdown extends StatefulWidget {
//   final String label;
//     String? value;
//   final bool enabled;
//   final List<String> items;
//   final void Function(String?) onChanged;
//
//    SelectorDropdown({
//     required this.label,
//      this.value,
//     required this.items,
//     required this.onChanged,
//     this.enabled = true,
//     super.key,
//   });
//
//   @override
//   State<SelectorDropdown> createState() => _SelectorDropdownState();
// }
//
// class _SelectorDropdownState extends State<SelectorDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 54,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: !enabled ? AppColors.gray : AppColors.border,
//         ),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             top: -12,left: 7,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//               decoration: BoxDecoration(
//                 color: !widget.enabled ? AppColors.gray : AppColors.secondaryLight,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//               child: Text(
//                label,
//                 style: AppTypography.caption2.copyWith(
//                   color: !widget.enabled ? AppColors.border : AppColors.text,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 value:value,
//                 items:items.map((String item) {
//                   return DropdownMenuItem(
//                     value: item,
//                     child: Text(
//                       item,
//                       style: AppTypography.bodyText4.copyWith(
//                         color: !widget.enabled ? AppColors.gray : AppColors.text,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged:enabled ? (e){
//                  value=e;
//                  onChanged(e);
//                   // setState(() {
//                   //
//                   // });
//                 } : null,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }