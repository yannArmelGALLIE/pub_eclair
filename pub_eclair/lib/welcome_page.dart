import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/features/authentication/screens/signin_page.dart';
import 'package:pub_eclair/features/authentication/screens/signup_page.dart';
import 'package:pub_eclair/utils/constants/colors.dart';
import 'package:pub_eclair/utils/constants/image_strings.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.secondary,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimationClassName(
                delay: 1500, 
                child: Container(
                  height: 100,
                  child: Image.asset(TImages.logo),
                ),
              ),
              DelayedAnimationClassName(
                delay: 2500, 
                child: Container(
                  height: 400,
                  child: Image.asset(TImages.logoApp),
                ),
              ),
              DelayedAnimationClassName(
                delay: 3500, 
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
                          builder: (context) => SigninPage(),
                        ),
                          );
                    }, 
                    child: Text(
                      'SE CONNECTER',
                      style:  GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                  )
                    ),
                ),
              ),
              DelayedAnimationClassName(
                delay: 3900, 
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
                          builder: (context) => SignupPage(),
                        ),
                          );
                    }, 
                    child: Text(
                      'S\'INSCRIRE',
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