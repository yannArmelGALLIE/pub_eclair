import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pub_eclair/common/widgets/images/t_rounded_image.dart';
import 'package:pub_eclair/features/shop/controllers/home_controller.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, 
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((img) => TRoundedImage(image: img)).toList(),
          options: CarouselOptions(
            viewportFraction: 0.8,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.textSecondary,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
