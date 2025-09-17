part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const EXPENSE_ADD = _Paths.EXPENSE_ADD;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = "/";
  static const HOME = "/home";
  static const EXPENSE_ADD = "/expense/add";
}