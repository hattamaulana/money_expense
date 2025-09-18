import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_expense/themes/colors/colors.dart';

class SummarySection extends StatelessWidget {
  final String day;
  final String month;

  const SummarySection({super.key, required this.day, required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _card(
              context: context,
              color: AppColor.Blue,
              title: 'home_summary_day'.tr,
              amount: day,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _card(
              context: context,
              color: AppColor.Teal,
              title: 'home_summary_month'.tr,
              amount: month,
            ),
          ),
        ],
      ),
    );
  }

  Widget _card({
    required BuildContext context,
    required Color color,
    required String title,
    required String amount,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The category name text
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),

          const SizedBox(height: 16),

          // The amount text
          Text(
            amount,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
