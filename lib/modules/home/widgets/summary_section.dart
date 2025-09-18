import 'package:flutter/material.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/widgets/cards/list_card.dart';

class SummarySection extends StatelessWidget {
  final List<ExpenseWithCategoryModel> list;

  const SummarySection({
    super.key,
    required this.list,a
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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