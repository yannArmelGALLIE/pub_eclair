import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/common/widgets/appBar/appBar.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/sizes.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class THomeAppBar extends StatefulWidget {
  const THomeAppBar({super.key});

  @override
  State<THomeAppBar> createState() => _THomeAppBarState();
}

class _THomeAppBarState extends State<THomeAppBar> {

  String fullName = "";

  @override
  void initState() {
    super.initState();
    _loadUserFullName();
  }

  Future<void> _loadUserFullName() async {
    final prefs = await SharedPreferences.getInstance();
    final lastName = prefs.getString("lastName") ?? "";
    final firstname = prefs.getString("firstname") ?? "";

    setState(() {
      fullName = "$lastName $firstname";
    });
  }

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,style: GoogleFonts.poppins(
            color: TColors.textSecondary,
            fontSize: 20,
            fontWeight: FontWeight.w600
            )
          ),
          Text(fullName ,style: GoogleFonts.poppins(
            color: TColors.textWhite,
            fontSize: TSizes.fontSizeMd,
            fontWeight: FontWeight.w400
            )
          ),
        ],
      ),
    );
  }
}
