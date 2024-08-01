import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  // Handles basic icon customization for given [assetPath] based on [color] and [scale] desired
  final String assetPath;
  final Color? color;
  final double? scale;

  const AssetIcon({
    required this.assetPath,
    this.color,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color ?? Colors.black,
        BlendMode.srcATop,
      ),
      child: Image.asset(
        assetPath,
        scale: scale,
      ),
    );
  }
}
