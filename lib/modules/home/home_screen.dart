import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_expense/modules/home/home_controller.dart';
import 'package:money_expense/modules/home/widgets/category_list_section.dart';
import 'package:money_expense/modules/home/widgets/grouped_transactions_section.dart';
import 'package:money_expense/modules/home/widgets/summary_section.dart';
import 'package:money_expense/utils/ext/double.dart';
import 'package:money_expense/widgets/header/home_header.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      // Floating Action Button for adding a new expense
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToAddExpense,
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.surface,
          size: 30,
        ),
      ),

      // The main content of the screen
      body: SafeArea(
        child: Obx(
          () => ListView(
            children: [
              // 1. Header Section
              HomeHeader(),
              SizedBox(height: 16),

              // 2. Expense Summary Cards
              SummarySection(
                day: controller.daily.value.formatToRupiah(),
                month: controller.monthly.value.formatToRupiah(),
              ),
              SizedBox(height: 24),

              //
              CategoryListSection(
                title: 'section_category_title'.tr,
                list: controller.dataByCategory.value ?? [],
              ),
              SizedBox(height: 24),

              // 4. Grouped Transaction List
              GroupedTransactionSection(
                title: 'section_today'.tr,
                list: controller.dataToday.value ?? [],
              ),
              SizedBox(height: 24),

              GroupedTransactionSection(
                title: 'section_yesterday'.tr,
                list: controller.dataYesterday.value ?? [],
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
