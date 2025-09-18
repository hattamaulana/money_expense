import 'package:get/get.dart';
import 'package:money_expense/modules/expense_add/expense_add_binding.dart';
import 'package:money_expense/modules/expense_add/expense_add_screen.dart';
import 'package:money_expense/modules/home/home_binding.dart';
import 'package:money_expense/modules/home/home_screen.dart';
import 'package:money_expense/modules/splash/splash_binding.dart';
import 'package:money_expense/modules/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: _Paths.EXPENSE_ADD,
      page: () => ExpenseAddScreen(),
      binding: ExpenseAddBinding()
    )
  ];
}