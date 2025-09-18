part of '../database.dart';

class Expense extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  RealColumn get amount => real()();

  DateTimeColumn get datetime => dateTime()();

  IntColumn get categoryId => integer().references(Category, #id, onDelete: KeyAction.cascade)();
}