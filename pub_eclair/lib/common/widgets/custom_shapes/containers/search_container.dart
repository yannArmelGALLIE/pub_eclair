import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';
import 'package:pub_eclair/utils/device/device_utility.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  // final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal : TSizes.defaultSpace),
        child: Container(
          width: TDeviceUtils.getSreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: TColors.textWhite,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg,),
            border: Border.all(color: TColors.borderPrimary),
          ),
          child: Row(
            children: [
               Icon(Icons.search, color: TColors.borderSecondary),
               const SizedBox(width: TSizes.spaceBtwItems),
               Text(TTexts.searchInStore, style: GoogleFonts.poppins()),
            ],
          ),
        ),
      ),
    );
  }
}