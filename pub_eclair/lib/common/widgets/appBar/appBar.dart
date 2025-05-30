// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.actions, 
    this.backgroundColor = Colors.transparent,
    });

    final Widget? title;
    final bool showBackArrow;
    final IconData? leadingIcon;
    final VoidCallback? leadingOnPressed;
    final List<Widget>? actions;
    final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        leading: showBackArrow 
        ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back))
        : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
