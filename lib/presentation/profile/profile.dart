import 'dart:io';

import 'package:ecommerce_app/app/di.dart';
import 'package:ecommerce_app/presentation/profile/profile_controller.dart';
import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:ecommerce_app/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ProfileController _controller =
      Get.put(ProfileController(instance.get()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.profile),
      ),
      body: Center(
        child: Stack(
          children: [
            Obx(
              () => _controller.imagePath.value.isEmpty
                  ? const CircleAvatar(
                      radius: AppSize.s90,
                      backgroundImage: AssetImage('assets/images/man.png'),
                    )
                  : CircleAvatar(
                      radius: AppSize.s90,
                      backgroundImage:
                          FileImage(File(_controller.imagePath.value)),
                    ),
            ),
            Positioned(
              bottom: 5,
              right: 3,
              child: IconButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                icon: Icon(
                  Icons.camera_alt_rounded,
                  size: AppSize.s36,
                  color: ColorManager.darkPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: AppSize.s200,
          color: ColorManager.primaryOpacity70,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorManager.darkPrimary,
                    // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child: const Text(AppStrings.openCamera),
                  onPressed: () {
                    Navigator.pop(context);
                    _controller.takeFromCamera();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorManager.darkPrimary,
                    // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child: const Text(AppStrings.openGallery),
                  onPressed: () {
                    Navigator.pop(context);
                    _controller.pickImageFromGallery();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
