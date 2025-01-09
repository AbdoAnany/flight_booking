import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/app_typography..dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key,  this.title=''});
  final String title ;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 48,
      toolbarHeight: 76,
      title:  Text(title, style: AppTypography.bodyText2),
      actions: [
        title == 'Ezy Travel' ? const SizedBox() :
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: AppColors.textSecondary,
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 76);
}
