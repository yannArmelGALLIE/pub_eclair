import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/utils/constants/enums.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: TSizes.fontSizeSm,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }


}