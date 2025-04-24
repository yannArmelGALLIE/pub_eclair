import 'package:flutter/material.dart';
import 'package:pub_eclair/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return  TVerticalImageText(
            image: TImages.logo,
            title: TTexts.market,
            textColor: TColors.textWhite,
            onTap: () {},
          );
        },
      ),
    );
  }
}