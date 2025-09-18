import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String expense;
  final String categoryName;
  final String amount;

  const ListCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.expense,
    required this.categoryName,
    required this.amount,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Icon and Title on the left
          Icon(icon, color: iconColor, size: 24),

          const SizedBox(width: 12),
          
          Text(
            expense,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Spacer pushes the amount to the far right
          const Spacer(),

          // Amount on the right
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}