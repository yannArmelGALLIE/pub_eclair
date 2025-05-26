import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/appBar/tabbar.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pub_eclair/common/widgets/layouts/grid_layout.dart';
import 'package:pub_eclair/common/widgets/products/product_card/t_brand_card.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/screens/store/widgets/category_tab.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final List<Map<String, String>> products_1 = [
      {
        "image": TImages.product_3,
        "title": "Repas",
        "subtitle": "Chez Adja",
        "price": "3000",
      },
    ];
        final List<Map<String, String>> products_2 = [
      {
        "image": TImages.sweat,
        "title": "Sweat",
        "subtitle": "ABIDALSHOP",
        "price": "5000",
      },
      {
        "image": TImages.bag,
        "title": "Sac à main",
        "subtitle": "ABIDALSHOP",
        "price": "10 000",
      },
      {
        "image": TImages.product_2,
        "title": "Vêtements",
        "subtitle": "ABIDALSHOP",
        "price": "5000",
        "sales": "50%",
      },
    ];
        final List<Map<String, String>> products_3 = [
      {
        "image": TImages.product_1,
        "title": "Skincare",
        "subtitle": "ABIDALSHOP",
        "price": "2000",
        "sales": "25%",
      },
    ];
        final List<Map<String, String>> products_4 = [
      {
        "image": TImages.sweat,
        "title": "Sweat",
        "subtitle": "ABIDALSHOP",
        "price": "5000",
      },
      {
        "image": TImages.bag,
        "title": "Sac à main",
        "subtitle": "ABIDALSHOP",
        "price": "10 000",
      },
      {
        "image": TImages.product_1,
        "title": "Skincare",
        "subtitle": "ABIDALSHOP",
        "price": "2000",
        "sales": "25%",
      },
      {
        "image": TImages.product_2,
        "title": "Vêtements",
        "subtitle": "ABIDALSHOP",
        "price": "5000",
        "sales": "50%",
      },
      {
        "image": TImages.product_3,
        "title": "Repas",
        "subtitle": "Chez Adja",
        "price": "3000",
      },
    ];
    final List<Map<String, String>> shops = [
      {"image": TImages.sweat, "title": "ABIDALSHOP", "subtitle": "10m"},
      {"image": TImages.food, "title": "Panini", "subtitle": "3m"},
      {"image": TImages.food_2, "title": "Alloco", "subtitle": "3m"},
      {"image": TImages.food_3, "title": "Dêguê", "subtitle": "10m"},
    ];
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: TAppBar(
          backgroundColor: TColors.primary,
          title: Text(
            TTexts.store,
            style: GoogleFonts.poppins(
              color: TColors.textWhite,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // TCartCounterIcon(onPressed: () {})
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScroolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: TColors.primary,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(),
                      SizedBox(height: TSizes.spaceBtwSections),

                      TSectionHeading(
                        title: TTexts.nearbyStores,
                        textColor: TColors.textSecondary,
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final shop = shops[index];
                          return TBrandCard(
                            showBorder: true,
                            image: shop["image"]!,
                            title: shop["title"]!,
                            subtitle: shop["subtitle"]!,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                bottom: TTabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        TTexts.food,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        TTexts.clothes,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Produits beautés",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        TTexts.electronics,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        TTexts.sports,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Tab(
                      child: Text(
                        TTexts.supplies,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        TTexts.hospitals,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        TTexts.schools,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        TTexts.institutions,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TCategoryTab(products: products_1),
              TCategoryTab(products: products_2),
              TCategoryTab(products: products_3),
              TCategoryTab(products: products_4),
              TCategoryTab(products: products_4),
              TCategoryTab(products: products_4),
              TCategoryTab(products: products_4),
              TCategoryTab(products: products_4),
              TCategoryTab(products: products_4),
            ],
          ),
        ),
      ),
    );
  }
}
