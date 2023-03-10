import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_app/src/common_widgets/custom_button_widget.dart';
import 'package:sarang_app/src/common_widgets/custom_text_button_widget.dart';
import 'package:sarang_app/src/common_widgets/logo_and_tagline_widget.dart';
import 'package:sarang_app/src/common_widgets/upload_photo_widget.dart';
import 'package:sarang_app/src/features/authentication/domain/user_account.dart';
import 'package:sarang_app/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:sarang_app/src/features/likes_you/presentation/explore_people_screen.dart';
import 'package:sarang_app/src/theme_manager/color_manager.dart';
import 'package:sarang_app/src/theme_manager/font_manager.dart';
import 'package:sarang_app/src/theme_manager/style_manager.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';
import 'package:sarang_app/src/utils/image_picker_util.dart';

class SignUpUploadPhotoScreen extends StatefulWidget {
  static const String routeName = '/sign-up-upload-photo';
  const SignUpUploadPhotoScreen({super.key});

  @override
  State<SignUpUploadPhotoScreen> createState() =>
      _SignUpUploadPhotoScreenState();
}

class _SignUpUploadPhotoScreenState extends State<SignUpUploadPhotoScreen> {
  File? image;

  void getImageProfile(GetImageFrom source) async {
    final result = await ImagePickerUtil.getImage(source);
    if (result != null) {
      setState(() {
        image = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAccount userAccount =
        ModalRoute.of(context)?.settings.arguments as UserAccount;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            ExplorePeopleScreen.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPading.p24,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPading.p26,
                horizontal: AppPading.p24,
              ),
              child: Column(
                children: [
                  const LogoAndTaglineWidget(),
                  const SizedBox(
                    height: AppSize.s50,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 120,
                            child: Column(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    Navigator.pop(context);
                                    getImageProfile(GetImageFrom.camera);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppPading.p15,
                                      vertical: AppPading.p10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.camera,
                                          size: AppSize.s36,
                                          color: ColorManager.grey60,
                                        ),
                                        const SizedBox(
                                          width: AppSize.s12,
                                        ),
                                        Text(
                                          'Upload using camera',
                                          style: getBlackTextStyle(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    Navigator.pop(context);
                                    getImageProfile(GetImageFrom.gallery);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppPading.p15,
                                      vertical: AppPading.p10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.photo,
                                          size: AppSize.s36,
                                          color: ColorManager.grey60,
                                        ),
                                        const SizedBox(
                                          width: AppSize.s12,
                                        ),
                                        Text(
                                          'Upload using gallery',
                                          style: getBlackTextStyle(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: UploadPhotoWidget(
                      image: image,
                    ),
                  ),
                  const SizedBox(
                    height: 53,
                  ),
                  Text(
                    userAccount.fullname,
                    style: getWhiteTextStyle().copyWith(
                      fontSize: FontSizeManager.f22,
                      fontWeight: FontWeighManager.semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Text(
                    '${userAccount.age} ${userAccount.occupation}',
                    style: getBlackTextStyle(),
                  ),
                  const SizedBox(
                    height: 240,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomButtonWidget(
                        title: 'Update My Profile',
                        onTap: () {
                          if (image == null) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('No Image Update'),
                                backgroundColor: Colors.red[400],
                              ),
                            );
                            return;
                          }
                          userAccount.imageProfile = image?.path;
                          context.read<AuthBloc>().add(
                                RegisterAuthEvent(
                                  userAccount: userAccount,
                                  isRegister: true,
                                ),
                              );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  CustomTextButtonWidget(
                    title: 'Skip for Now',
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            RegisterAuthEvent(
                              userAccount: userAccount,
                              isRegister: true,
                            ),
                          );
                      Navigator.pushNamed(
                          context, ExplorePeopleScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
