import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/glass_card_widget.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class MatchCardWidget extends StatelessWidget {
  final User user;
  const MatchCardWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                user.imagePath,
              ),
            ),
            border: Border.all(
              width: 10,
              color: ColorManager.secondary,
              strokeAlign: StrokeAlign.inside,
            ),
            borderRadius: BorderRadius.circular(AppSize.s70),
          ),
        ),
        GlassCardWidget(
          user: user,
        ),
      ],
    );
  }
}
