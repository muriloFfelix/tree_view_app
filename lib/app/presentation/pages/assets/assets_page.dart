import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/app/presentation/pages/assets/components/assets_header.dart';
import 'package:tractian_mobile_app/app/presentation/pages/assets/components/tree_item_tile.dart';
import 'package:tractian_mobile_app/app/presentation/controllers/getx_assets_controller.dart';

class AssetsPage extends GetView<GetxAssetsController> {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _createAppBar(),
        body: controller.isLoading
            // Display body replacement while screens load
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
    final itemTree = controller.getTreeList(null);
    final List<String> idPath = [];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AssetsHeader().paddingSymmetric(horizontal: 15),
        const Divider(
          thickness: 0.8,
        ).marginOnly(top: 10),
        Flexible(
          child: itemTree.isNotEmpty
              ? SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: itemTree.length,
                    itemBuilder: (context, i) {
                      late int deepness;
                      if (idPath.contains(itemTree[i].parentId)) {
                        final index = idPath.indexOf(itemTree[i].parentId!);
                        deepness = index + 1;
                        idPath.removeRange(deepness, idPath.length);
                      } else if (itemTree[i] is AssetEntity &&
                          idPath.contains(
                              (itemTree[i] as AssetEntity).locationId)) {
                        final index = idPath
                            .indexOf((itemTree[i] as AssetEntity).locationId!);
                        deepness = index + 1;
                        idPath.removeRange(deepness, idPath.length);
                      } else {
                        deepness = 0;
                        idPath.clear();
                      }
                      idPath.add(itemTree[i].id);

                      return TreeItemTile(
                          entity: itemTree[i], deepness: deepness);
                    },
                  ),
                )
              // Display body replacement if there's no item to be shown
              : const Text(
                  'Não há items para serem mostrados com as configurações desejadas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF17192D),
                  ),
                ).marginOnly(top: 30),
        ),
      ],
    );
  }
}
