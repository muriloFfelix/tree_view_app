import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/presentation/controllers/getx_assets_controller.dart';
import 'package:tractian_mobile_app/app/presentation/widgets/asset_icon.dart';

class AssetsHeader extends GetView<GetxAssetsController> {
  // Displays the header for the page with search bar and filters

  const AssetsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Column(children: [
            // Sets component for search bar
            const CustomSearchField(),
            // Sets components for filter buttons
            Row(children: [
              FilterItem(
                'Sensor de Energia',
                assetPath: 'assets/images/energy_icon.png',
                isActive: controller.filterByEnergy,
                onTap: () {
                  controller.filterByEnergy = !controller.filterByEnergy;
                  controller.getFilterIds();
                },
              ).marginOnly(right: 10),
              FilterItem(
                'Crítico',
                assetPath: 'assets/images/critical_icon.png',
                isActive: controller.filterByAlert,
                onTap: () {
                  controller.filterByAlert = !controller.filterByAlert;
                  controller.getFilterIds();
                },
              ),
            ]).marginOnly(top: 10),
          ]),
        ],
      ),
    );
  }
}

class CustomSearchField extends GetView<GetxAssetsController> {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEFF3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller.inputController,
        onChanged: (_) => controller.getFilterIds(),
        decoration: const InputDecoration(
          icon: Icon(
            Icons.search,
            size: 20,
          ),
          hintText: 'Buscar Ativo ou Local',
          hintStyle: TextStyle(color: Color(0xFF8E98A3)),
          border: InputBorder.none,
          iconColor: Color(0xFF8E98A3),
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String text;
  final String assetPath;
  final bool isActive;
  final Function() onTap;

  const FilterItem(
    this.text, {
    super.key,
    required this.assetPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = isActive ? const Color(0xFF2188FF) : null;

    Color borderColor = isActive ? Colors.transparent : const Color(0xFFD8DFE6);

    Color contentColor = isActive ? Colors.white : const Color(0xFF77818C);

    return Ink(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(3)),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        borderRadius: BorderRadius.circular(3),
        child: Row(
          children: [
            AssetIcon(
              assetPath: assetPath,
              color: contentColor,
              scale: 2,
            ).marginOnly(right: 7.5),
            Text(
              text,
              style: TextStyle(
                color: contentColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 7.5, horizontal: 15),
      ),
    );
  }
}
