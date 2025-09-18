import 'package:flutter/material.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/widgets/cards/list_card.dart';

class GroupedTransactionSection extends StatelessWidget {
  final String title;
  final List<ExpenseWithCategoryModel> list;

  const GroupedTransactionSection({
    super.key,
    required this.title,
    required this.list,a
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),

          // List of transactions
          Column(
            children: list.map((e) {
              return Column(children: [
                ListCard(
                  icon: Icons.abc_outlined, 
                  iconColor: e.category.getColor(), 
                  expense: e.expense.name, 
                  categoryName: e.category.name, 
                  amount: (e.expense.amount).toString(),
                ),
                const SizedBox(height: 8)
              ]);
            }).toList()
          ),
        ],
      ),
    );
  }
}