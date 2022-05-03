import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthapp/service/themeService.dart';
import 'package:healthapp/utils/appThemes/appThemes.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init(); // a
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      initialRoute: AppPages.INITIAL,
      themeMode: ThemeMode.system, //
      getPages: AppPages.routes,
    ),
  );
}
