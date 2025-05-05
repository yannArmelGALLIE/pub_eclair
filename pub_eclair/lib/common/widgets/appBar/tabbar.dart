import 'package:flutter/material.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/device/device_utility.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tabs
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TColors.light,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: TColors.primary,
        unselectedLabelColor: TColors.textSecondary,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());

}