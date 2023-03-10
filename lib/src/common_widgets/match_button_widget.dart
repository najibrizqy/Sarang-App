import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';

class MatchButtonWidget extends StatelessWidget {
  final double dimension;
  final String iconPath;
  final VoidCallback onTap;
  const MatchButtonWidget({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.dimension = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            '${AssetImageIconManager.assetPath}$iconPath',
          ),
        )),
      ),
    );
  }
}
