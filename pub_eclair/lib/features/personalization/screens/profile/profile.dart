import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/images/t_circular_image.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  TAppBar(showBackArrow: true, title: Text(
        TTexts.profile,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
        )),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profille Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.logoUser,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        TTexts.changeProfilePicture,
                        style: GoogleFonts.poppins(
                          color: TColors.textPrimary,
                          fontWeight: FontWeight.w500
                          ),
                      ),
                    ),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: TTexts.profileInformations, showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: TTexts.lastName,
                value: TTexts.lastNameUser,
                onPressed: () {},
              ),
              TProfileMenu(
                title: TTexts.firstName,
                value: TTexts.firstNameUser,
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: TTexts.personalInformations, showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: TTexts.email,
                value: TTexts.emailUser,
                onPressed: () {},
              ),
              TProfileMenu(
                title: TTexts.phoneNumber,
                value: TTexts.phoneNumberUser,
                onPressed: () {},
              ),
              TProfileMenu(
                title: TTexts.userID,
                value: TTexts.userIDValue,
                icon: Icons.copy_outlined,
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    TTexts.closeAccount,
                    style: GoogleFonts.poppins(color: TColors.error),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

