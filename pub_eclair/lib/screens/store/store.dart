import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pub_eclair/common/widgets/layouts/grid_layout.dart';
import 'package:pub_eclair/common/widgets/products/product_card/t_brand_card.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            TTexts.store,
            style: GoogleFonts.poppins(
              color: TColors.primary,
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
                backgroundColor: Colors.transparent,
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
                        title: TTexts.featuredBrands,
                        textColor: TColors.textPrimary,
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const TBrandCard( showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),
      
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: TColors.primary,
                  labelColor: TColors.primary,
                  tabs: [
                  Tab(child: Text(
                    TTexts.schools,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  Tab(child: Text(
                    TTexts.electronics,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  Tab(child: Text(
                    TTexts.cosmetics,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  Tab(child: Text(
                    TTexts.clothes,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  Tab(child: Text(
                    TTexts.supplies,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  Tab(child: Text(
                    TTexts.hospitals,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  Tab(child: Text(
                    TTexts.schools,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  Tab(child: Text(
                    TTexts.institutions,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold
                    ),
                  )),
                ]),
              ),
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}


