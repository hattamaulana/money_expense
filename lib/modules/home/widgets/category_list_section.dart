import 'package:flutter/material.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/model/expense_w_total.dart';
import 'package:money_expense/utils/ext/double.dart';
import 'package:money_expense/widgets/cards/grid_card.dart';
import 'package:money_expense/widgets/menu/category_menu.dart';

class CategoryListSection extends StatelessWidget {
  final String title;
  final List<TotalEveryCategory> list;

  const CategoryListSection({
    super.key,
    required this.title,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
      ? Container()
      : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
    
        Container(
          height: 180,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 24,
              children: List.generate(list.length, (i) {
                final e = list[i];
                return GridCard(
                  leadingIcon: CategoryGridItem(
                    svgAsset: e.category.getIcon(),
                    color: e.category.getColor(),
                  ),
                  categoryName: e.category.name,
                  amount: e.totalAmount.formatToRupiah(),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
