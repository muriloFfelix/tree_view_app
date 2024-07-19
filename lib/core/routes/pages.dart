import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/ui/pages/assets/assets_bindings.dart';
import 'package:tractian_mobile_app/app/ui/pages/assets/assets_page.dart';
import 'package:tractian_mobile_app/app/ui/pages/home/home_bindings.dart';
import 'package:tractian_mobile_app/app/ui/pages/home/home_page.dart';
import 'package:tractian_mobile_app/core/routes/routes.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.ASSETS,
      page: () => const AssetsPage(),
      binding: AssetsBindings(),
    )
  ];
}
