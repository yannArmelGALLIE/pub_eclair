import 'package:flutter/material.dart';
import 'package:pub_eclair/common/widgets/texts/t_brand_title_text.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/enums.dart';
class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key, 
    required this.title, 
    this.maxLines = 1, 
    this.textColor, 
    this.iconColor = TColors.primary, 
    this.textAlign = TextAlign.center, 
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title : title,
            maxLines: maxLines,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        // const SizedBox(width: TSizes.xs),
        // const Icon(
        //   Icons.verified,
        //   color: TColors.black,
        //   size: TSizes.iconXs,
        // )
      ],
    );
  }
}
