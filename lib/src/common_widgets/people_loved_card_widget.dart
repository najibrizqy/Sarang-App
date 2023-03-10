import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/features/likes_you/presentation/people_profile_screen.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class PeopleLovedCardWidget extends StatelessWidget {
  final User user;
  const PeopleLovedCardWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPading.p24,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            PeopleProfileScreen.routeName,
            arguments: user,
          );
        },
        child: Container(
          margin: const EdgeInsets.only(
            bottom: AppMargin.m18,
          ),
          decoration: BoxDecoration(
            color: ColorManager.secondary,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(AppPading.p10),
            leading: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    user.imagePath,
                  ),
                ),
              ),
            ),
            title: Text(
              user.fullName,
              style: getWhiteTextStyle(
                fontSize: FontSizeManager.f20,
                fontWeight: FontWeighManager.semiBold,
              ),
            ),
            subtitle: Text(
              '${user.age}, ${user.occupation}',
              style: getGrey60TextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
