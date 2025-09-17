part of '../database.dart';

class Category extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get icon => text()();
}