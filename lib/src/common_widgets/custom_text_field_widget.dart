import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelName;
  final String hintText;
  final bool isObsecure;
  final TextEditingController controller;

  const CustomTextFieldWidget({
    super.key,
    required this.labelName,
    required this.hintText,
    required this.controller,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getWhiteTextStyle(),
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        TextField(
          controller: controller,
          obscureText: isObsecure,
          style: getWhiteTextStyle(),
          cursorColor: ColorManager.white,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppPading.p15,
              horizontal: AppPading.p30,
            ),
            filled: true,
            fillColor: ColorManager.secondary,
            hintText: hintText,
            hintStyle: getBlack30TextStyle(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppSize.s50,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppSize.s50,
              ),
              borderSide: BorderSide(color: ColorManager.pink),
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s14,
        ),
      ],
    );
  }
}
