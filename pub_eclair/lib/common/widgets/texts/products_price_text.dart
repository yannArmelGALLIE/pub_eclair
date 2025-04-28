import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key, 
    required this.price, 
    required this.currency,
  });

  final String price;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Text(
      price + currency,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(fontSize: TSizes.fontSizeMd),
    );
  }
}



