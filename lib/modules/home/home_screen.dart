import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_expense/modules/home/home_controller.dart';
import 'package:money_expense/modules/home/widgets/category_list_section.dart';
import 'package:money_expense/modules/home/widgets/grouped_transactions_section.dart';
import 'package:money_expense/modules/home/widgets/summary_section.dart';
import 'package:money_expense/widgets/header/home_header.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      
      // Floating Action Button for adding a new expense
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF008D9E),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),

      // The main content of the screen
      body: SafeArea(
        child: ListView(
          children: [
            // 1. Header Section
            HomeHeader(),
            SizedBox(height: 16),

            // 2. Expense Summary Cards
            SummarySection(list: []),
            SizedBox(height: 24),

            // 
            CategoryListSection(
              title: 'section_category_title'.tr,
              list: [],
            ),
            SizedBox(height: 24),

            // 4. Grouped Transaction List
            GroupedTransactionSection(
              title: "",
              list: [],
            ),
            SizedBox(height: 80), 
          ],
        ),
      ),
    );
  }
}