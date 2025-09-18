import 'package:flutter/material.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/widgets/menu/category_menu.dart';

class CategoryDialog extends StatelessWidget {
  final List<CategoryModel> categories;
  final void Function(CategoryModel) onSelected;

  const CategoryDialog({
    super.key,
    required this.categories,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pilih Kategori',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () =>
                    Navigator.of(context).pop(), // Close the sheet/dialog
              ),
            ],
          ),
          const SizedBox(height: 8),

          Container(
            height: 350,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),

              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryGridItem(
                  svgAsset: 'assets/icons/${category.icon}.svg',
                  label: category.name,
                  color: Color(category.color),
                  onTap: () {
                    onSelected(category);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
