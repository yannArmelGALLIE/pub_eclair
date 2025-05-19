import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.icon = Icons.keyboard_arrow_right_outlined,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: TColors.textSecondary,
                  fontSize: TSizes.fontSizeSm,
                  ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: TColors.primary,
                  fontSize: TSizes.fontSizeMd,
                  ),
              ),
            ),
            Expanded(
              child: Icon(
                icon,
                color: TColors.primary,
                size: 18,
                ),
            )
          ],
        ),
      ),
    );
  }
}
