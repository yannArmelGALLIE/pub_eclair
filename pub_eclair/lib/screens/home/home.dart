import 'package:flutter/material.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pub_eclair/common/widgets/layouts/grid_layout.dart';
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
    final List<Map<String, String>> products = [
      {"image" : TImages.sweat, "title" : "Sweat", "subtitle" : "ABIDALSHOP", "price" : "5000"},
      {"image" : TImages.bag, "title" : "Sac à main", "subtitle" : "ABIDALSHOP", "price" : "10 000"},
      {"image" : TImages.product_1, "title" : "Skincare", "subtitle" : "ABIDALSHOP", "price" : "2000", "sales" : "25%"},
      {"image" : TImages.product_2, "title" : "Vêtements", "subtitle" : "ABIDALSHOP", "price" : "5000", "sales" : "50%"},
      {"image" : TImages.product_3, "title" : "Repas", "subtitle" : "Chez Adja", "price" : "3000"},
    ];

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
                          showActionButton: true,
                          textColor: TColors.textWhite,
                          onPressed: () {},
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
                 const TPromoSlider(
                    banners: [
                      TImages.banner,
                      TImages.banner,
                      TImages.banner
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                        TSectionHeading(
                          title: TTexts.popularProdutcs,
                          showActionButton: true,
                          textColor: TColors.textPrimary,
                          onPressed: () {},
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                  // Popular Products
                  TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      final product = products[index];
                    return TProductCardVertical(
                      image: product["image"]!, 
                      title: product["title"]!, 
                      subtitle: product["subtitle"]!, 
                      price: product["price"]!,
                      sales: product["sales"],
                      );
                      },
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

