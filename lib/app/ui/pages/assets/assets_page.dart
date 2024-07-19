import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/presentation/presenters/getx_assets_presenter.dart';
import 'package:tractian_mobile_app/app/ui/pages/assets/components/assets_header.dart';
import 'package:tractian_mobile_app/app/ui/pages/assets/components/tree_item_tile.dart';

class AssetsPage extends GetView<GetxAssetsPresenter> {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _createAppBar(),
        body: controller.isLoading
            ? const Center(
                child: Text(
                  'Carregando...',
                  style: TextStyle(fontSize: 25, color: Color(0xFF17192D)),
                ),
              )
            : _createBody().paddingOnly(top: 15),
      ),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF17192D),
      leading: IconButton(
        icon: const Icon(
          CupertinoIcons.chevron_left,
          color: Colors.white,
        ),
        iconSize: 30,
        onPressed: () => Get.back(),
      ),
      title: const Text(
        'Assets',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  Widget _createBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AssetsHeader().paddingSymmetric(horizontal: 15),
        const Divider(
          thickness: 0.8,
        ).marginOnly(top: 10),
        Flexible(
          child: SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.getItemsGroup(null).length,
              itemBuilder: (context, i) {
                return TreeItemTile(
                    entity: controller.getItemsGroup(null)[i], deepness: 0);
              },
            ),
          ),
        ),
      ],
    );
  }
}
