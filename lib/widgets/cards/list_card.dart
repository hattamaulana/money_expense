import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final Widget leadingIcon;
  final String expense;
  final String amount;

  const ListCard({
    super.key,
    required this.leadingIcon,
    required this.expense,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icon and Title on the left
            leadingIcon,
            SizedBox(width: 12),

            // Name of expense
            Text(
              expense,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Spacer pushes the amount to the far right
            Spacer(),

            // Amount on the right
            Text(
              amount,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
