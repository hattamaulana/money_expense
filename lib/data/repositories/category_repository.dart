import 'package:injectable/injectable.dart';
import 'package:money_expense/domain/model/category.dart';

abstract class CategoryRepository {

  Future<bool> initializeCategory({
    required String name,
    required String icon,
    required int color
  });

  Future<List<CategoryModel>> retrieve();
}


@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {

  @override
  Future<bool> initializeCategory({
    required String name,
    required String icon,
    required int color
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>> retrieve() {
    throw UnimplementedError();
  }
}