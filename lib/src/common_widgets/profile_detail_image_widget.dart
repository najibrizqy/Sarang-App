import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widgets/match_button_widget.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class ProfileDetailImageWidget extends StatelessWidget {
  final String imagePath;
  const ProfileDetailImageWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 420,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPading.p40,
            horizontal: AppPading.p26,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MatchButtonWidget(
                dimension: 24,
                iconPath: '/icon_arrow_left.png',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'Lover Profile\nDetails',
                textAlign: TextAlign.center,
                style: getWhiteTextStyle(
                  fontWeight: FontWeighManager.semiBold,
                  fontSize: FontSizeManager.f20,
                ),
              ),
              MatchButtonWidget(
                dimension: 24,
                iconPath: '/icon_close_circle.png',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ExplorePeopleScreen.routeName,
                    (route) => false,
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
