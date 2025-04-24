import 'package:flutter/material.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pub_eclair/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/screens/home/widgets/home_appbar.dart';
import 'package:pub_eclair/screens/home/widgets/home_categories.dart';
import 'package:pub_eclair/screens/home/widgets/promo_slider.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // SearchBar
                  TSearchContainer(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        TSectionHeading(
                          title: TTexts.popularCategories,
                          showActionButton: false,
                          textColor: TColors.textWhite,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        // Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo slider
                  TPromoSlider(
                    banners: [
                      TImages.banner,
                      TImages.banner,
                      TImages.banner
                    ],
                  ),
                  SizedBox(height: TSizes.defaultSpace),
                  // Popular Products
                  TProductCardVertical()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

