import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class GlassCardWidget extends StatelessWidget {
  final User user;
  const GlassCardWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m26,
        horizontal: AppMargin.m30,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppPading.p15,
        horizontal: AppPading.p24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            '${AssetImageIconManager.assetPath}/glass_card_image.png',
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: getWhiteTextStyle(
                    fontSize: FontSizeManager.f20,
                    fontWeight: FontWeighManager.semiBold,
                  ),
                ),
                Text(
                  '${user.age} ${user.occupation}',
                  style: getWhiteTextStyle(
                    fontSize: FontSizeManager.f14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '${AssetImageIconManager.assetPath}/icon_profile.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
