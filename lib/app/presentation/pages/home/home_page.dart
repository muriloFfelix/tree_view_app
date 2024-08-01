import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';
import 'package:tractian_mobile_app/app/presentation/controllers/getx_assets_controller.dart';
import 'package:tractian_mobile_app/app/presentation/controllers/getx_home_controller.dart';
import 'package:tractian_mobile_app/app/presentation/widgets/asset_icon.dart';
import 'package:tractian_mobile_app/core/routes/routes.dart';

class HomePage extends GetView<GetxHomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: Obx(
        () => ListView(
          children: [
            for (final company in controller.companiesList)
              CompanyCard(company).marginOnly(bottom: 40),
          ],
        ).marginSymmetric(horizontal: 20, vertical: 30),
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF17192D),
      title: Image.asset(
        'assets/images/logo.png',
        width: 250,
        alignment: Alignment.center,
      ),
      centerTitle: true,
    );
  }
}

class CompanyCard extends StatelessWidget {
  // Displays the company for a given [CompanyEntity]
  final CompanyEntity entity;

  const CompanyCard(
    this.entity, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: const Color(0xFF2188FF),
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () => Get.toNamed(Routes.ASSETS,
            arguments: AssetsPageParams(companyId: entity.id)),
        highlightColor: const Color(0xFF17192D),
        borderRadius: BorderRadius.circular(5),
        child: Row(
          children: [
            const AssetIcon(
              assetPath: 'assets/images/company_icon.png',
              color: Colors.white,
              scale: 1.5,
            ).marginOnly(right: 15),
            Text(
              '${entity.name} Unit',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 30, vertical: 30),
      ),
    );
  }
}
