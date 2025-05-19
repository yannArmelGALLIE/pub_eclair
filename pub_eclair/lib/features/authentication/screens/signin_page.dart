import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/features/authentication/screens/widgets/sign_in_form.dart';
import 'package:pub_eclair/utils/constants/colors.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimationClassName(
                    delay: 500, 
                    child: Text(
                      "Ravi de vous revoir !",
                      style: GoogleFonts.poppins(
                        color: TColors.primary,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  DelayedAnimationClassName(
                    delay: 1000, 
                  child: Text(
                    "Accédez à votre compte.",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 35),
            SignInForm(),
          ],
        ),
      ),
    );
  }
}

