import 'package:flutter/material.dart';
import 'package:pub_eclair/common/widgets/brands/brand_show_case.dart';
import 'package:pub_eclair/common/widgets/layouts/grid_layout.dart';
import 'package:pub_eclair/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandShowcase(
              images: [TImages.product, TImages.product, TImages.product],
            ),
            TSectionHeading(
              title: "Vous pourriez aimer",
              onPressed: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
      
            TGridLayout(
              itemCount: 4, 
              itemBuilder: (_, index) => const TProductCardVertical()
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
      ]
    );
  }
}
