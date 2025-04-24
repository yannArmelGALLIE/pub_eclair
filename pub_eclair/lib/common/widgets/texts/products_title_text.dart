import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key, 
    required this.title, 
    this.smallSize = false, 
    this.maxLines = 2, 
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}