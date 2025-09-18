// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/datasource/local/dao/category.dart' as _i776;
import '../data/datasource/local/dao/expense.dart' as _i1003;
import '../data/datasource/local/database.dart' as _i1036;
import '../data/repositories/category_repository.dart' as _i136;
import '../data/repositories/expense_repository.dart' as _i308;
import '../domain/usecase/category_usecase.dart' as _i342;
import '../domain/usecase/expense_usecase.dart' as _i120;
import '../modules/expense_add/expense_add_controller.dart' as _i804;
import '../modules/home/home_controller.dart' as _i247;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final module = _$Module();
    gh.lazySingleton<_i1036.AppDatabase>(() => module.db);
    gh.lazySingleton<_i776.CategoryDao>(() => module.categoryDao);
    gh.lazySingleton<_i1003.ExpenseDao>(() => module.expenseDao);
    gh.lazySingleton<_i136.CategoryRepository>(
      () => _i136.CategoryRepositoryImpl(gh<_i776.CategoryDao>()),
    );
    gh.lazySingleton<_i308.ExpenseRepository>(
      () => _i308.ExpenseRepositoryImpl(gh<_i1003.ExpenseDao>()),
    );
    gh.lazySingleton<_i342.InitializeCategoryUsecase>(
      () => _i342.InitializeCategoryUsecase(gh<_i136.CategoryRepository>()),
    );
    gh.lazySingleton<_i342.RetriveCategoryUsecase>(
      () => _i342.RetriveCategoryUsecase(gh<_i136.CategoryRepository>()),
    );
    gh.lazySingleton<_i120.TotalExpenseDailyUsecase>(
      () => _i120.TotalExpenseDailyUsecase(gh<_i308.ExpenseRepository>()),
    );
    gh.lazySingleton<_i120.TotalExpenseMonthlyUsecase>(
      () => _i120.TotalExpenseMonthlyUsecase(gh<_i308.ExpenseRepository>()),
    );
    gh.lazySingleton<_i120.ExpenseByCategoryUsecase>(
      () => _i120.ExpenseByCategoryUsecase(gh<_i308.ExpenseRepository>()),
    );
    gh.lazySingleton<_i120.ExpenseTodayUsecase>(
      () => _i120.ExpenseTodayUsecase(gh<_i308.ExpenseRepository>()),
    );
    gh.lazySingleton<_i120.ExpenseYesterdayUsecase>(
      () => _i120.ExpenseYesterdayUsecase(gh<_i308.ExpenseRepository>()),
    );
    gh.lazySingleton<_i120.CreateNewExpenseUsecase>(
      () => _i120.CreateNewExpenseUsecase(gh<_i308.ExpenseRepository>()),
    );
    gh.factory<_i247.HomeController>(
      () => _i247.HomeController(
        gh<_i342.InitializeCategoryUsecase>(),
        gh<_i120.TotalExpenseDailyUsecase>(),
        gh<_i120.TotalExpenseMonthlyUsecase>(),
        gh<_i120.ExpenseByCategoryUsecase>(),
        gh<_i120.ExpenseTodayUsecase>(),
        gh<_i120.ExpenseYesterdayUsecase>(),
      ),
    );
    gh.factory<_i804.ExpenseAddController>(
      () => _i804.ExpenseAddController(
        gh<_i342.RetriveCategoryUsecase>(),
        gh<_i120.CreateNewExpenseUsecase>(),
      ),
    );
    return this;
  }
}

class _$Module extends _i946.Module {}
