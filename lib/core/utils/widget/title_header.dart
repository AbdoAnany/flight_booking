
import 'package:flutter/material.dart';

import '../../theme/app_typography..dart';

class TitleHeader extends StatelessWidget {
  final String title;
  const TitleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Text(
          title,
          style:AppTypography.bodyText3

      ),
    );
  }
}
