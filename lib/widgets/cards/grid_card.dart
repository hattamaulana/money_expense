import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String categoryName;
  final String amount;

  const GridCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.categoryName,
    required this.amount,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The circular icon
          CircleAvatar(
            radius: 22,
            backgroundColor: iconBackgroundColor,
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 16),

          // The category name text
          Text(
            categoryName,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),

          // The amount text
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}