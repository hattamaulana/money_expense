import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:money_expense/injection/injection.dart';
import 'package:money_expense/routes/app_pages.dart';
import 'package:money_expense/themes/themes.dart';
import 'package:money_expense/utils/translations/app_translations.dart';

void main() {
  configureInjection();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  runApp(
    GetMaterialApp(
      // Setup themes
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Setup translations
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('id', 'ID'),

      // Set routes & screen
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child ?? Container(),
            );
          },
        ),
    )
  );
}
