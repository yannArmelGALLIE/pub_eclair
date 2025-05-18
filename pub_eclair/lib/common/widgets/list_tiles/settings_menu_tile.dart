import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subTitle, 
    this.trailing, 
    this.onTap
    });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary,),
      title: Text(
        title, 
        style: GoogleFonts.poppins(color: TColors.primary, fontWeight: FontWeight.w600)
        ),
      subtitle: Text(
        subTitle, 
        style: GoogleFonts.poppins(color: TColors.primary, fontWeight: FontWeight.w300)
        ),
      trailing: trailing,
      onTap: onTap,
        );
  }
}