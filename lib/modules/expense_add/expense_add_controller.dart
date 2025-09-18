import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:money_expense/data/datasource/local/database.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/domain/usecase/category_usecase.dart';
import 'package:money_expense/domain/usecase/expense_usecase.dart';

@injectable
class ExpenseAddController extends GetxController {
  String _name = '';
  String _amount = '';

  final RetriveCategoryUsecase _retriveCategoryUsecase;
  final CreateNewExpenseUsecase _createNewExpenseUsecase;

  ExpenseAddController(
    this._retriveCategoryUsecase,
    this._createNewExpenseUsecase,
  );

  final buttonEnabled = RxBool(false);
  final categories = Rxn<List<CategoryModel>>();
  final selectedCategory = Rxn<CategoryModel>();
  final selectedDatetime = Rxn<DateTime>();

  String getDateTime() {
    return DateFormat('d MMMM yyyy').format(selectedDatetime.value!);
  }

  @override
  void onInit() async {
    super.onInit();

    final list = await _retriveCategoryUsecase.execute();

    categories(list);
    selectedCategory(list.first);
  }

  void _checkButtonReady() {
    buttonEnabled(_name != '' && _amount != '' && selectedDatetime.value != null);
  }

  void onNameChanged(String value) {
    _name = value;
    _checkButtonReady();
  }

  void onAmountChanged(String value) {
    _amount = value;
    _checkButtonReady();
  }

  void onTapCategory(CategoryModel value) {
    selectedCategory(value);
    _checkButtonReady();
  }

  void onTapDate(DateTime value) {
    selectedDatetime(value);
    _checkButtonReady();
  }

  Future<String?> onPressButton() async {
    bool success = false;
    String? message;

    if (buttonEnabled.value == false) {
      return null;
    }

    try {
      await _createNewExpenseUsecase.execute(
        ExpenseCompanion.insert(
          name: _name,
          amount: double.parse(_amount),
          datetime: selectedDatetime.value!,
          categoryId: selectedCategory.value!.id!,
        ),
      );

      success = true;
    } on Exception catch (e) {
      message = e.toString();
    }

    if (success) {
      Get.back();
    } 

    return message;
  }
}
