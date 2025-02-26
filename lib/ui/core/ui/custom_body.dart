import 'package:flutter/material.dart';

import '../themes/spacing.dart';

class CustomBody extends StatefulWidget {
  final List<Widget> children;
  const CustomBody({super.key, required this.children});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.regular16),
      child: Column(
        spacing: Spacing.regular16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
}
