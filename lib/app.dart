import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/config/routes/app_routes.dart';
import 'package:task/config/themes/app_themes.dart';
import 'package:task/core/utils/app_strings.dart';
import 'package:get/get.dart';
import 'core/shared_pref.dart';
import 'core/translation/translation.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: Translation(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          title: AppStrings.appTitle,
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: preferences.getBool("isDark") == true
              ? ThemeMode.dark
              : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoute.onGenerateRoute,
        );
      },
    );
  }
}
