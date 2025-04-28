import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pub_eclair/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pub_eclair/common/widgets/images/t_circular_image.dart';
import 'package:pub_eclair/common/widgets/layouts/grid_layout.dart';
import 'package:pub_eclair/common/widgets/texts/T_brand_title_text_with_verified_icon.dart';
import 'package:pub_eclair/common/widgets/texts/section_heading.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/enums.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          TTexts.store,
          style: GoogleFonts.poppins(
            color: TColors.primary,
            fontSize: TSizes.fontSizeLg,
            fontWeight: FontWeight.w600,
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
              // backgroundColor: TColors.light,
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
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    TGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: TRoundedContainer(
                            padding: const EdgeInsets.all(TSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                Flexible(
                                  child: TCircularImage(
                                    isNetworkImage: false,
                                    image: TImages.logo,
                                    backgroundColor: Colors.transparent,
                                    overlayColor: TColors.light,
                                  ),
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems / 2),

                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TBrandTitleWithVerifiedIcon(
                                        title: "Produit",
                                        brandTextSize: TextSizes.large,
                                      ),
                                      Text(
                                        "256 produits",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: TColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
