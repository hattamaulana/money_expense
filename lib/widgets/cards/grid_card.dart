import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final Widget leadingIcon;
  final String categoryName;
  final String amount;

  const GridCard({
    super.key,
    required this.leadingIcon,
    required this.categoryName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.inverseSurface.withAlpha(30),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The circular icon
          leadingIcon,
          const SizedBox(height: 16),

          // The category name text
          Text(
            categoryName,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.inverseSurface.withAlpha(100),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          // The amount text
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.inverseSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
