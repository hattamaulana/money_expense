import 'package:drift/drift.dart';
import 'package:money_expense/data/datasource/local/database.dart';

part 'category.g.dart';

@DriftAccessor(tables: [Category])
class CategoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<int> insert(CategoryCompanion data) => into(category).insert(data);

  Future<List<CategoryData>> fetchAll() => select(category).get();
}