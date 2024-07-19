import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/core/routes/pages.dart';
import 'package:tractian_mobile_app/core/routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'TRACTIAN Mobile',
    initialRoute: Routes.HOME,
    getPages: AppPages.pages,
  ));
}
