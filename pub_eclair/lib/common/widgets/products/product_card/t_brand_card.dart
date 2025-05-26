import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pub_eclair/common/widgets/images/t_circular_image.dart';
import 'package:pub_eclair/common/widgets/texts/T_brand_title_text_with_verified_icon.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/enums.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.showBorder = true
  });

  final String image, title, subtitle;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        borderColor: TColors.primary,
        backgroundColor: TColors.light,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: image,
                backgroundColor: Colors.transparent,
                // overlayColor: TColors.light,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
    
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: title,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: TColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}