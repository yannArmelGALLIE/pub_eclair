import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/features/authentication/screens/signup_client_page.dart';
import 'package:pub_eclair/features/authentication/screens/signup_advertiser_page.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/text_strings.dart';

class SignupPage extends StatelessWidget {

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
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    DelayedAnimationClassName(
                    delay: 500, 
                    child: Text(
                      TTexts.signUpTo,
                      style: GoogleFonts.poppins(
                        color: TColors.primary,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
            SizedBox(height: 125),
              DelayedAnimationClassName(
                delay: 1000, 
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      foregroundColor: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => SignupToClientPage(),
                        ),
                          );
                    }, 
                    child: Text(
                      TTexts.client,
                      style:  GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                  )
                    ),
                ),
              ),
            SizedBox(height: 30),
              DelayedAnimationClassName(
                delay: 1500, 
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      foregroundColor: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => SignupToAdvertiserPage(),
                        ),
                          );
                    }, 
                    child: Text(
                      TTexts.advertiser,
                      style:  GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    )
                      ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}