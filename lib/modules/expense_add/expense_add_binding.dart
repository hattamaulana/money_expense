import 'package:get/get.dart';
import 'package:money_expense/modules/expense_add/expense_add_controller.dart';

class ExpenseAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpenseAddController>(
      () => ExpenseAddController(),
    );
  }
}