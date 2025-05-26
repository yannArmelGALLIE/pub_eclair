// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
// import 'package:pub_eclair/common/widgets/icons/t_circular_icon.dart';
// import 'package:pub_eclair/common/widgets/layouts/grid_layout.dart';
// import 'package:pub_eclair/common/widgets/products/product_card/product_card_vertical.dart';
// import 'package:pub_eclair/screens/home/home.dart';
// import 'package:pub_eclair/utils/constants/sizes.dart';

// class FavouriteScreen extends StatelessWidget {
//   const FavouriteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TAppBar(
//         title: Text("Wishlist", style: GoogleFonts.poppins()),
//         actions: [
//           TCircularIcon(
//             icon: Icons.add,
//             onPressed: () => Get.to(const HomeScreen()),
//           ),
//         ],
//       ),

//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: TGridLayout(
//             itemCount: 6,
//             itemBuilder: (_, index) => TProductCardVertical(),
//           ),
//         ),
//       ),
//     );
//   }
// }
