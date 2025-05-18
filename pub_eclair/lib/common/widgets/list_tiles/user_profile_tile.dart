import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/images/t_circular_image.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: TImages.logo,
        width: 50,
        height: 50,
        padding: 0,
        ),
      title: Text(
        TTexts.fullName, 
        style: GoogleFonts.poppins(color: TColors.textWhite, fontWeight: FontWeight.w600)
        ),
      subtitle: Text(
        TTexts.emailUser, 
        style: GoogleFonts.poppins(color: TColors.textWhite, fontWeight: FontWeight.w300)
        ),
      trailing: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.edit, color: TColors.textWhite)
        ),
    );
  }
}