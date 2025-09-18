import 'package:flutter/material.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/model/expense.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/widgets/cards/grid_card.dart';

class CategoryListSection extends StatelessWidget {
  final String title;
  final List<ExpenseWithCategoryModel> list;

  const CategoryListSection({
    super.key,
    required this.title,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 12),

          // List of transactions
          Column(
            children: list.map((e) {
              return Column(children: [
                GridCard(
                  icon: e.category.getIcon(), 
                  iconBackgroundColor: Color(e.category.color), 
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