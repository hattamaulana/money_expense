import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/modules/expense_add/dialogs/category_dialog.dart';
import 'package:money_expense/modules/expense_add/expense_add_controller.dart';
import 'package:money_expense/widgets/input/select.dart';
import 'package:money_expense/widgets/input/textfield.dart';
import 'package:money_expense/widgets/menu/category_menu.dart';

class ExpenseAddScreen extends GetView<ExpenseAddController> {
  ExpenseAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        title: Text('expense_add_title'.tr),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DOTTextField(
                hintText: 'expense_add_form_name'.tr,
                onChanged: controller.onNameChanged,
              ),
              SizedBox(height: 16),

              DOTSelectorField(
                onTap: () => _showCategoryPicker(context),
                leadingIcon: controller.selectedCategory.value != null
                    ? CategoryGridItem(
                        svgAsset: controller.selectedCategory.value!.getIcon(),
                        color: controller.selectedCategory.value!.getColor(),
                        useBackground: false,
                      )
                    : null,
                text: controller.selectedCategory.value?.name ?? '',
                trailingIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 16),

              DOTSelectorField(
                onTap: () => _showDatePicker(context),
                text: controller.selectedDatetime.value == null
                    ? 'expense_add_form_datetime'.tr
                    : controller.getDateTime(),
                trailingIcon: Icon(
                  Icons.calendar_today_rounded,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 16),

              DOTTextField(
                hintText: 'expense_add_form_amount'.tr,
                keyboardType: TextInputType.number,
                onChanged: controller.onAmountChanged,
              ),
              SizedBox(height: 32),

              // Save Button
              ElevatedButton(
                onPressed: () => controller.onPressButton().then((e) {
                  if (e != null) {}
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.buttonEnabled.value
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'expense_add_button_save'.tr,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCategoryPicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return CategoryDialog(
          categories: controller.categories.value ?? [],
          onSelected: controller.onTapCategory,
        );
      },
    ).then((selectedCategory) {});
  }

  void _showDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: controller.selectedDatetime.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.onTapDate(pickedDate);
    }

    print(pickedDate);
  }
}
