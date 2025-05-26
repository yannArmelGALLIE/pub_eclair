import 'package:flutter/material.dart';
import 'package:pub_eclair/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {"image": TImages.food, "title": "Repas"},
      {"image": TImages.clothing, "title": "Vêtements"},
      {"image": TImages.cap, "title": "Casquettes"},
      {"image": TImages.bike, "title": "Motos"},
      {"image": TImages.pc, "title": "Ordinateurs"},
      {"image": TImages.shoes, "title": "Chaussures"},
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          return TVerticalImageText(
            image: category["image"]!,
            title: category["title"]!,
            textColor: TColors.textWhite,
            onTap: () {},
          );
        },
      ),
    );
  }
}
