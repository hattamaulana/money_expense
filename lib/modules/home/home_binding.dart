import 'package:get/get.dart';
import 'package:money_expense/injection/injection.dart';
import 'package:money_expense/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => getIt<HomeController>(),
    );
  }
}