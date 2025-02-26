import 'package:flutter/material.dart';

import '../../../core/themes/colors.dart';
import '../../../core/themes/spacing.dart';

class NotFoundEmployees extends StatelessWidget {
  const NotFoundEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: double.maxFinite,
        height: Spacing.medium80,
        decoration: BoxDecoration(
          color: AppColors.grey2,
          border: Border.all(
            color: AppColors.grey2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_search_sharp),
            Text("Nenhum funcionário encontrado!"),
          ],
        ),
      ),
    );
  }
}
