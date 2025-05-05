import 'package:flutter/material.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pub_eclair/common/widgets/products/product_card/t_brand_card.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.dark,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(
        bottom: TSizes.spaceBtwItems
      ),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
    
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }

      Widget brandTopProductImageWidget(String image, context) {
        return Expanded(
                        child: TRoundedContainer(
                height: 100,
                backgroundColor: TColors.light,
                margin: const EdgeInsets.only(right: TSizes.sm),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(image),
                ),
              ),
        );
    }
}
