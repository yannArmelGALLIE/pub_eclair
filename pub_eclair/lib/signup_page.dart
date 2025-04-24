import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pub_eclair/delayed_animation.dart';
import 'package:pub_eclair/signup_client_page.dart';
import 'package:pub_eclair/signup_shopkeeper_page.dart';
import 'package:pub_eclair/utils/constants/colors.dart';

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
                    delay: 1500, 
                    child: Text(
                      "Vous voulez vous inscrire en tant que :",
                      style: GoogleFonts.poppins(
                        color: TColors.primary,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
            SizedBox(height: 125),
              DelayedAnimationClassName(
                delay: 2500, 
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
                          builder: (context) => SignupClientPage(),
                        ),
                          );
                    }, 
                    child: Text(
                      'CLIENT',
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
                          builder: (context) => SignupShopkeeperPage(),
                        ),
                          );
                    }, 
                    child: Text(
                      'COMMER\u00C7ANT',
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