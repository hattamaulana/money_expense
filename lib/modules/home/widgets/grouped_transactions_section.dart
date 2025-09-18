import 'package:flutter/material.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/model/expense_w_category.dart';
import 'package:money_expense/utils/ext/double.dart';
import 'package:money_expense/widgets/cards/list_card.dart';
import 'package:money_expense/widgets/menu/category_menu.dart';

class GroupedTransactionSection extends StatelessWidget {
  final String title;
  final List<ExpenseWithCategoryModel> list;

  const GroupedTransactionSection({
    super.key,
    required this.title,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return  list.isEmpty
      ? Container()
      : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),

          // Datalist
          ...list.map((e) {
            return Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: ListCard(
                leadingIcon: CategoryGridItem(
                  svgAsset: e.category.getIcon(),
                  color: e.category.getColor(),
                  useBackground: false,
                ),
                expense: e.expense.name,
                amount: e.expense.amount.formatToRupiah(),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
