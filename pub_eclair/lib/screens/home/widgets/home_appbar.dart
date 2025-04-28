import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: GoogleFonts.poppins(
            color: TColors.textSecondary,
            fontSize: 20,
            fontWeight: FontWeight.w600
            )
          ),
          Text(TTexts.homeAppbarSubTitle,style: GoogleFonts.poppins(
            color: TColors.textWhite,
            fontSize: TSizes.fontSizeMd,
            fontWeight: FontWeight.w400
            )
          ),
        ],
      ),
    );
  }
}
