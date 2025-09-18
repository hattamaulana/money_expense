import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:money_expense/data/repositories/category_repository.dart';
import 'package:money_expense/domain/model/category.dart';
import 'package:money_expense/utils/enum/base_usecase.dart';



@lazySingleton
class InitializeCategoryUsecase extends NoParamUseCase<int> {

  final CategoryRepository _repository;

  InitializeCategoryUsecase(this._repository);
  
  @override
  Future<int> execute() async {
    if ((await _repository.retrieve()).isNotEmpty) {
      return 0;
    }

    final params = [
      CategoryModel(name: 'Makanan', icon: 'food', color: 0xFFF2C94C),
      CategoryModel(name: 'Internet', icon: 'internet', color: 0xFF56CCF2),
      CategoryModel(name: 'Edukasi', icon: 'education', color: 0xFFF2994A),
      CategoryModel(name: 'Hadiah', icon: 'gift', color: 0xFFEB5757),
      CategoryModel(name: 'Transport', icon: 'transport', color: 0xFF9B51E0),
      CategoryModel(name: 'Belanja', icon: 'shopping', color: 0xFF27AE60),
      CategoryModel(name: 'Alat Rumah', icon: 'home', color: 0xFFBB6BD9),
      CategoryModel(name: 'Olahraga', icon: 'sport', color: 0xFF2D9CDB),
      CategoryModel(name: 'Hiburan', icon: 'entertain', color: 0xFF2F80ED),
    ];

    try {
      for (var e in params) {
        _repository.initializeCategory(name: e.name, icon: e.icon, color: e.color);
      }

      return 1;
    } catch(e) {
      return -1;
    }
  }
}



@lazySingleton
class RetriveCategoryUsecase extends NoParamUseCase<List<CategoryModel>> {

  final CategoryRepository _repository;

  RetriveCategoryUsecase(this._repository);
  
  @override
  Future<List<CategoryModel>> execute() async {
    return _repository.retrieve();
  }
}