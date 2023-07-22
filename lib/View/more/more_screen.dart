import 'package:task/shared/widgets/app_title.dart';
import 'package:task/shared/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/translation/controller.dart';
import 'more_controller.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    //bool isDarkMode = preferences.getBool('isDark') ?? false;
    return Scaffold(
        appBar: AppBar(
          title: AppTitle(title: 'More'.tr),
        ),
        body: cupertino.Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Setting".tr, isBold: true),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 5.h),
              GetBuilder(
                  init: MoreController(),
                  builder: (controller) {
                    return ListTile(
                      title: Text("Dark Mode".tr),
                      trailing: cupertino.CupertinoSwitch(
                          value: controller.isDarkMode,
                          onChanged: (value) async {
                            controller.changThem(value);
                          }),
                    );
                  }),
              SizedBox(height: 5.h),
              const Divider(),
              SizedBox(height: 5.h),
              GetBuilder(
                  init: AppLanguage(),
                  builder: (AppLanguage controller) {
                    return ListTile(
                      title: Text("language".tr),
                      trailing: cupertino.CupertinoSwitch(
                          value: 'locale'.tr == 'ar',
                          onChanged: (value) {
                            controller.changeLanguage('en'.tr);
                            Get.updateLocale(Locale('en'.tr));
                          }),
                    );
                  }),
            ],
          ),
        ));
  }
}
