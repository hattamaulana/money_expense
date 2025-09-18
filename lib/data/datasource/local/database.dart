import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:money_expense/data/datasource/local/dao/category.dart';
import 'package:money_expense/data/datasource/local/dao/expense.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'table/category.dart';
part 'table/expense.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Category, Expense], daos: [CategoryDao, ExpenseDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}