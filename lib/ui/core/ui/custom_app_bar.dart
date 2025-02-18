import 'package:flutter/material.dart';
import '../themes/colors.dart';
import '../themes/spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Spacing.medium80,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: Spacing.regular16),
        child: CircleAvatar(
          backgroundColor: AppColors.grey3,
          child: Text("CG", style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: Spacing.regular16),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none_outlined),
                iconSize: 32,
                color: AppColors.black1,
                onPressed: () {},
              ),
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 10,
                  child: Text("02",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}