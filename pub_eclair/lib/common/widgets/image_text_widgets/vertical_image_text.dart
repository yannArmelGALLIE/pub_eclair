import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    required this.textColor, 
    this.backgroundColor = TColors.textWhite, 
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration:BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image : AssetImage(image), fit: BoxFit.cover, color: TColors.black,),
              ), 
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 56,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: TSizes.fontSizeSm
                ),
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
