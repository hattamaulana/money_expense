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
    return this;
  }
}

class _$Module extends _i946.Module {}
