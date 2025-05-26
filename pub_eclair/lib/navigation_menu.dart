import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_eclair/features/personalization/screens/settings/settings.dart';
import 'package:pub_eclair/screens/home/home.dart';
import 'package:pub_eclair/screens/map/map.dart';
import 'package:pub_eclair/screens/store/store.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx (
        () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        backgroundColor: TColors.secondary,
        indicatorColor: TColors.secondary.withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home, color: TColors.primary,), label: TTexts.home),
          NavigationDestination(icon: Icon(Icons.store, color: TColors.primary,), label: TTexts.store),
          NavigationDestination(icon: Icon(Icons.map, color: TColors.primary,), label: 'Carte'),
          NavigationDestination(icon: Icon(Icons.settings, color: TColors.primary,), label: TTexts.settings),
        ],
      ),
    ),
    body: Obx( () => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const MapScreen(),
    const SettingsScreen(),
  ];
}
