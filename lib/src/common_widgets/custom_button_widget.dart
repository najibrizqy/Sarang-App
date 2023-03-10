import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButtonWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s50),
          gradient: LinearGradient(
            colors: [
              ColorManager.pink,
              ColorManager.purple,
            ],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          ),
        ),
        child: Text(
          title,
          style: getWhiteTextStyle(fontWeight: FontWeighManager.semiBold),
        ),
      ),
    );
  }
}
