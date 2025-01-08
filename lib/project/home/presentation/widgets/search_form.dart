// lib/presentation/widgets/date_picker_field.dart
import 'package:flight_booking_app/core/theme/app_color.dart';
import 'package:flight_booking_app/core/theme/app_typography..dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final String? value;
  final Function(DateTime) onSelect;
  final bool enabled;

  const DatePickerField({
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
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: enabled ? () => _showDatePicker(context) : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                      style: AppTypography.caption2

                  ),
                  Text(
                    value ?? 'Select Date',
                    style: AppTypography.bodyText4
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Iconsax.calendar_1,
                size: 20,
                color: AppColors.textSecondary,
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
  }
}

// lib/presentation/widgets/selector_field.dart
class SelectorField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const SelectorField({
    required this.label,
    required this.value,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                  style: AppTypography.caption2

              ),
              Text(
                value,
                  style: AppTypography.bodyText4

              ),
            ],
          ),
        ),
      ),
    );
  }
}