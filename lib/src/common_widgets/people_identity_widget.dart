import 'package:flutter/material.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class PeopleIdentityWidget extends StatelessWidget {
  final User user;
  const PeopleIdentityWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPading.p24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: getWhiteTextStyle(
              fontSize: FontSizeManager.f28,
              fontWeight: FontWeighManager.semiBold,
            ),
          ),
          Text(
            '${user.age}, ${user.occupation}',
            style: getBlackTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Text(
            user.description,
            style: getWhiteTextStyle(),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
        ],
      ),
    );
  }
}
