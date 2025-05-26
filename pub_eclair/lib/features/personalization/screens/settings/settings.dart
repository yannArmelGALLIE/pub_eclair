import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pub_eclair/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:pub_eclair/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/features/personalization/screens/profile/profile.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  String fullName = "";
  String email = ""; 

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final lastName = prefs.getString("lastName") ?? "";
    final firstname = prefs.getString("firstname") ?? "";
    final emailUser = prefs.getString("emailUser") ?? "";

    setState(() {
      fullName = "$lastName $firstname";
      email = emailUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      TTexts.account,
                      style: GoogleFonts.poppins(color: TColors.textWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TUserProfileTile(
                    fullName: fullName,
                    emailUser: email,
                    onPressed: () {
                    Get.to(() => const ProfileScreen());
                  }
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: TTexts.accountSettings, showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Icons.shopping_basket,
                    title: TTexts.myCart,
                    subTitle: "",
                  ),
                  TSettingsMenuTile(
                    icon: Icons.notifications,
                    title: TTexts.notifications,
                    subTitle: "",
                  ),
                  TSettingsMenuTile(
                    icon: Icons.privacy_tip,
                    title: TTexts.accountPrivacy,
                    subTitle: "",
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: TTexts.appSettings, showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Icons.location_on,
                    title: TTexts.geolocation,
                    subTitle: "",
                    trailing: Switch(value: true, onChanged: (value) {}, activeColor: TColors.primary,),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.dark_mode,
                    title: TTexts.darkMode,
                    subTitle: "",
                    trailing: Switch(value: false, onChanged: (value) {}, activeColor: TColors.primary),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {}, 
                      child: Text(
                        TTexts.logout,
                        style: GoogleFonts.poppins(color: TColors.primary, fontWeight: FontWeight.w600)
                        )),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
