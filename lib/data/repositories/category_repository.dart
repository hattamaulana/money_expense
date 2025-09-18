import 'package:injectable/injectable.dart';
import 'package:money_expense/data/datasource/local/dao/category.dart';
import 'package:money_expense/data/datasource/local/database.dart';
import 'package:money_expense/domain/model/category.dart';

abstract class CategoryRepository {
  Future<int> initializeCategory({
    required String name,
    required String icon,
    required int color,
  });

  Future<List<CategoryModel>> retrieve();
}

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDao _dao;

  CategoryRepositoryImpl(this._dao);

  @override
  Future<int> initializeCategory({
    required String name,
    required String icon,
    required int color,
  }) => _dao.insert(
    CategoryCompanion.insert(name: name, icon: icon, color: color),
  );

  @override
  Future<List<CategoryModel>> retrieve() async {
    final res = await _dao.fetchAll();

    return res
        .map(
          (e) => CategoryModel(
            id: e.id,
            name: e.name,
            icon: e.icon,
            color: e.color,
          ),
        )
        .toList();
  }
}
